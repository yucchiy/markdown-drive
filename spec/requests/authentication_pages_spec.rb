require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do

  let(:user) { FactoryGirl.create(:user) }

  describe "Check header status" do

    specify 'When user logged in' do

      login_as(user, :scope => :user)
      visit root_path

      expect(page).not_to have_link('Sign up', new_user_registration_path)
      expect(page).not_to have_link('Sign in', new_user_session_path)
      expect(page).to have_link('Sign out', destroy_user_session_path)
    end

    specify 'When user logged out' do

      logout(:user)
      visit root_path

      expect(page).to have_link('Sign up', new_user_registration_path)
      expect(page).to have_link('Sign in', new_user_session_path)
      expect(page).not_to have_link('Sign out', destroy_user_session_path)
    end
  end
end
