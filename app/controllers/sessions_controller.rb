class SessionsController < ApplicationController

  def create
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
