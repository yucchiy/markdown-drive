require 'active_support/concern'

module Api::Exceptions
  class Base < StandardError
  end
end

module Api::ErrorHandlers
  extend ActiveSupport::Concern

  class RescuableException
    attr_accessor :status, :message

    def initialize(status = 500, message = "")
      @status_code = status_code
    end
  end

  included do
    rescue_from StandardError, with :rescue_exception
  end

  RESCUABLE_EXCEPTIONS = {
    ActiveRecord::RecordNotFound.to_s.to_sym => RescuableException.new(404, "Record not found")
  }

  private

  def rescue_exception(exception)
    if rescuable(exception)
    else
    end
  end

  def rescuable?(exception)
  end
end
