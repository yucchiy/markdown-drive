require 'rails_helper'

RSpec.describe UserSetting, :type => :model do
  context "check attributes" do
    it "is invalid without a user" do
      expect(FactoryGirl.build(:user_setting, user: nil)).not_to be_valid
    end
  end
end
