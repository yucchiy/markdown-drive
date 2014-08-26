require 'active_support/concern'

module Api::Exceptions
  class Base < StandardError
  end
end

module Api::ErrorHandlers
  extend ActiveSupport::Concern

  attr_accessor :status, :message

  class RescuableException < StandardError
    attr_accessor :status, :message

    def initialize(status = 500, message = "")
      @status = status
    end
  end

  included do
    rescue_from StandardError, :with => :rescue_exception
    before_filter :setup
  end

  RESCUABLE_EXCEPTIONS = {
    ActiveRecord::RecordNotFound.to_s.to_sym => RescuableException.new(404, "Record not found")
  }

  private

  def rescue_exception(e)
    @message = e.message
    re = RESCUABLE_EXCEPTIONS[e.to_s.to_sym]
    @status = re.status

    render 'api/errors/base'
  end

  def rescuable?(e)
    return e.is_a?(RescuableException)
  end

  def setup
    @status = 200
    @message = "OK"
  end
end
