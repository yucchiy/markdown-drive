class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def authenticate!
    raise Api::Exceptions::UnAuthenticationException if !signed_in?
  end

  def authenticate_with_dropbox!
    raise Api::Exceptions::UnAuthenticationException "No dropbox authentication" if !signed_in? || !Identity.get_with_user_and_provider(@current_user, "dropbox").present?
  end
end
