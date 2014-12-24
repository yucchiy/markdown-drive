class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by_auth_hash(auth_hash)
    user.create_user_setting if user.user_setting == nil
    user.save

    sign_in user
    redirect_to user
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
