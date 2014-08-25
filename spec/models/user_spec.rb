require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is name valid with name" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:user, name: nil)).to be_invalid
  end
end
