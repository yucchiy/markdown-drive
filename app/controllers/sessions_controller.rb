class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.with_omniauth!(auth)

    if signed_in?
      if @identity.user.present?
        if @identity.user == current_user
          redirect_to root_url, notice: "Already linked that account!"
        else
          redirect_to root_url, notice: "Another user already linked that account!"
        end
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        @identity.user = User.create_with_omniauth(auth)
        @identity.save
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed up Successfully!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
