require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #show" do
    context 'with a valid user_id' do
      before (:each) {
        @user = FactoryGirl.create(:user)
        get :show, id: @user.id
      }

      it 'responds successfully with user profile' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq(@user)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    context 'with a invalid user_id' do
      it 'responds with an HTTP 404 status code' do
        get :show, id: -1
        expect(response).not_to be_success
        expect(response).to have_http_status(404)
      end
    end
  end
end
