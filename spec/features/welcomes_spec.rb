require 'rails_helper'

feature "Welcomes", :type => :feature do

  scenario 'visit root_path without an authentication' do
    visit root_path
    expect(page).to have_content 'Sign in with Github'
  end
end
