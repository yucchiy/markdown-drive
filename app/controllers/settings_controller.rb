class SettingsController < ApplicationController

  before_action :authenticated_user!
  before_action :set_user_setting

  def edit
  end

  def update
    if user_setting_params['repository'].present? and @user_setting.update_attributes(user_setting_params)
      flash[:success] = 'Updated your setting successfully'
    else
      flash[:error]   = 'Failed to update your setting'
    end

    redirect_to edit_setting_path
  end

  private
  def user_setting_params
    params.require(:user_setting).permit(:repository)
  end

  def set_user_setting
    @user_setting = current_user.user_setting
  end
end
