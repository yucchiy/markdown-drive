class ErrorsController < ApplicationController
  SUPPORTED_STATUS = [404]

  def show(status)
    if SUPPORTED_STATUS.include?(status)
    else
    end
  end
end
