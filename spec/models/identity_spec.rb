require 'rails_helper'

RSpec.describe Identity, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:identity_dropbox)).to be_valid
  end

  it "is invalid without username" do
    expect(FactoryGirl.build(:identity_dropbox, username: nil)).to be_invalid
  end

  it "is invalid without uid" do
    expect(FactoryGirl.build(:identity_dropbox, uid: nil)).to be_invalid
  end

  it "is invalid without provider" do
    expect(FactoryGirl.build(:identity_dropbox, provider: nil)).to be_invalid
  end

  it "is invalid with unknown provider" do
    expect(FactoryGirl.build(:identity_dropbox, provider: :unknown)).to be_invalid
  end

  it "is invalid without associated user" do
    expect(FactoryGirl.build(:identity_dropbox, user_id: nil)).to be_invalid
  end

  it "does not allow duplicate identities" do
    FactoryGirl.create(:identity_dropbox)
    expect(FactoryGirl.build(:identity_dropbox)).to be_invalid
  end
end