class SessionsController < ApplicationController

  def create
    pp auth_hash
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
