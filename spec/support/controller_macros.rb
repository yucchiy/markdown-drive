module ControllerMacros

  def sign_in(user)
    controller.send(:sign_in, user)
  end

  def signed_in?
    controller.send(:signed_in?)
  end

  def current_user
    controller.send(:current_user)
  end

end
