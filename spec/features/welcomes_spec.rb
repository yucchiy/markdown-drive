require 'rails_helper'

feature "Welcomes", :type => :feature do

  scenario 'visit root_path without an authentication' do
    visit root_path
    expect(page).to have_content 'Sign in with Github'
  end

  scenario 'sign in with Github' do
    visit root_path
    click_link 'Sign in with Github'
    expect(current_path).to eq '/auth/github'
  end
end
