require 'rails_helper'

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end

  it "is invalid with a long name" do
    expect(FactoryGirl.build(:user, name: Faker::Lorem.characters(51))).not_to be_valid
  end

  it "is invalid without a screen_name" do
    expect(FactoryGirl.build(:user, screen_name: nil)).not_to be_valid
  end

  it "is invalid with a duplicate screen_name" do
    same_screen_name = "ziro"
    FactoryGirl.create(:user, screen_name: same_screen_name)
    expect(FactoryGirl.build(:user, screen_name: same_screen_name)).not_to be_valid
  end

  it "is invalid without a github_id" do
    expect(FactoryGirl.build(:user, github_id: nil)).not_to be_valid
  end

  it "is invalid with a duplicate github_id" do
    same_token = "onazitoken"
    FactoryGirl.create(:user, github_id: same_token)
    expect(FactoryGirl.build(:user, github_id: same_token)).not_to be_valid
  end

  it "is invalid without a github_token" do
    expect(FactoryGirl.build(:user, github_token: nil)).not_to be_valid
  end
end
