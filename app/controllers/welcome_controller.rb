class WelcomeController < ApplicationController

  def index
    if signed_in?
      if Identity.get_with_user_and_provider(@current_user, "dropbox")
        render 'welcome/index_dropbox'
      else
        render 'welcome/index_no_dropbox'
      end
    else
      render 'welcome/index'
    end
  end
end
