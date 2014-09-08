require 'active_support/concern'

module Api::Exceptions
  class RescuableException < StandardError
    attr_accessor :status

    def initialize(status = 500, message = "Error")
      super(message)
      @status = status
    end
  end

  class UnAuthenticationException < RescuableException
    def initialize(message = "Unauthorized")
      super(401, message)
    end
  end
end

module Api::ErrorHandlers
  extend ActiveSupport::Concern

  attr_accessor :status, :message

  included do
    before_filter :setup
    rescue_from StandardError, :with => :rescue_exception
  end

  RESCUABLE_EXCEPTIONS = {
    ActiveRecord::RecordNotFound.to_s.to_sym => Api::Exceptions::RescuableException.new(404)
  }

  private

  def rescue_exception(e)
    @message = e.message
    if rescuable?(e)
      re = e.is_a?(Api::Exceptions::RescuableException) ? e : RESCUABLE_EXCEPTIONS[e.to_s.to_sym]
      @status = re.status
    else
      @status = 500
      @message = e.message
    end

    render status: @status, template: 'api/errors/base'
  end

  def rescuable?(e)
    return e.is_a?(Api::Exceptions::RescuableException) || RESCUABLE_EXCEPTIONS.has_key?(e.to_s.to_sym)
  end

  def setup
    @status = 200
    @message = "OK"
  end
end
