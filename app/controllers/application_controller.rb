class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  attr_accessor :current_user

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    reset_session
    @current_user = nil
  end

  def authenticated_user!
    redirect_to root_path unless signed_in?
  end
end
