class SessionsController < ApplicationController

  def create
    p auth_hash.credentials
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
