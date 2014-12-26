require 'rails_helper'

RSpec.describe Article, :type => :model do
  describe "check attributes" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:article)).to be_valid
    end

    it "is invalid without a title" do
      expect(FactoryGirl.build(:article, title: nil)).not_to be_valid
    end

    it "is invalid without an associated user" do
      expect(FactoryGirl.build(:article, user: nil)).not_to be_valid
    end
  end
end
