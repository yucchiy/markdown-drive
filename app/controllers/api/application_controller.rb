class Api::ApplicationController < ApplicationController

  layout "api/layouts/application"

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  include Api::ErrorHandlers

  protected

  def json_request?
    request.format.json?
  end
end