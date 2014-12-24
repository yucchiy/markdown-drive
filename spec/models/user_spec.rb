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

  it "is invalid without an avatar_url" do
    expect(FactoryGirl.build(:user, avatar_url: nil)).not_to be_valid
  end

  it "is invalid when an avatar_url is not url" do
    expect(FactoryGirl.build(:user, avatar_url: "koreha-url-dehanai")).not_to be_valid
  end

  context "User.find_or_create_by_auth_hash(auth_hash)" do

    let(:user) { FactoryGirl.build(:user) }
    let(:auth_hash) { OmniAuth::AuthHash.new({
      'provider' => 'github',
      'uid' => '123456',
      'info' => {
        'nickname' => 'test_taro',
        'name' => 'Test Taro',
        'image' => 'https://avatars1.githubusercontent.com/u/325819',
      },
      'credentials' => {
        'token' => 'himitsunotokenda'
      },
      'extra' => {
        'raw_info' => {
        }
      }
    }) }

    it "returns a new user when such a auth_hash does not exist" do
      expect(User.find_or_create_by_auth_hash(auth_hash)).to be_valid
    end

    it "returns a new user when such a auth_hash exists" do
      user.save
      auth_hash['credentials']['token'] = user.github_token
      expect(User.find_or_create_by_auth_hash(auth_hash)).to eq(user)
    end
  end
end
