require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe 'GET #create' do
    before {
      request.env['omniauth.auth'] = OmniAuth::AuthHash.new({
        'provider' => 'github',
        'uid' => '123456',
        'info' => {
          'nickname' => 'taro_tanaka',
          'name' => 'Taro tanaka',
        },
        'credentials' => {
          'token' => 'himitsunotokenda'
        },
        'extra' => {
          'raw_info' => {
          }
        }
      })
    }

    context 'user try signing in' do
      context 'who has an authentication' do
        it 'redirect to mypage with an authentication' do
          user = FactoryGirl.create(:user)
          sign_in(user)
          get :create, provider: :github
          expect(current_user.id).to eq(user.id)
          expect(response).to redirect_to(user_path(current_user))
        end
      end

      context 'who does not have an authentication' do
        it 'redirect to mypage with an authentication' do
          get :create, provider: :github
          expect(signed_in?).to eq(true)
          expect(response).to redirect_to(user_path(current_user))
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user try signing out' do
      context 'who has an authentication' do
        it 'redirects to root_path with signing out' do
          user = FactoryGirl.create(:user)
          sign_in(user)
          delete :destroy
          expect(current_user).to be_nil
          expect(response).to redirect_to(root_path)
        end
      end

      context 'who does not have an authentication' do
        it 'redirects to root_path' do
          delete :destroy
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
