require 'rails_helper'

RSpec.describe SettingsController, :type => :controller do
  describe 'GET #edit' do
    context 'without an authentication' do
      it 'redirects to root_path' do
        get :edit
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with an authentication' do
      before (:each) {
        @user = FactoryGirl.create(:user)
        sign_in @user
      }

      it 'responds successfully with the authentication' do
        get :edit
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the :edit template' do
        get :edit
        expect(response).to render_template :edit
      end

      it 'assigns the authenticated user\'s setting to @user_setting' do
        get :edit
        expect(assigns(:user_setting)).to eq(@user.user_setting)
      end
    end
  end

  describe 'PATCH #update' do
    context 'without an authentication' do
      it 'redirects to root_path' do
          patch :update
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with an authentication' do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      context 'with valid params' do
        before :each do
          @params = { user_setting: FactoryGirl.attributes_for(:user_setting) }
          patch :update, @params
        end

        it 'update new repository url' do
          expect(current_user.user_setting.repository).to eq(@params[:user_setting][:repository])
        end

        it 'flash has :success key' do
          expect(flash[:success]).to eq('Updated your setting successfully')
        end
      end

      context 'with invalid params' do
        before :each do
          @params = { user_setting: { repository: "" } }
          patch :update, @params
        end

        it 'flash has :error key' do
          expect(flash[:error]).to eq('Failed to update your setting')
        end
      end
    end
  end
end
