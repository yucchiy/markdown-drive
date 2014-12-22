module ControllerMacros

  def set_user_session(user)
    session[:user_id] = user.id
  end
end
