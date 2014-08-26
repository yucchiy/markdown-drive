require 'rails_helper'

RSpec.describe Document, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:document)).to be_valid
  end

  it "is invalid without path" do
    expect(FactoryGirl.build(:document, path: nil)).to be_invalid
  end

  it "is invalid without rev" do
    expect(FactoryGirl.build(:document, rev: nil)).to be_invalid
  end

  it "is invalid without revision" do
    expect(FactoryGirl.build(:document, revision: nil)).to be_invalid
  end

  it "is invalid without bytes" do
    expect(FactoryGirl.build(:document, bytes: nil)).to be_invalid
  end

  it "is invalid without size" do
    expect(FactoryGirl.build(:document, size: nil)).to be_invalid
  end

  it "is invalid without is_deleted" do
    expect(FactoryGirl.build(:document, is_deleted: nil)).to be_invalid
  end

  it "is_deleted should be boolean" do
    expect(FactoryGirl.build(:document, is_deleted: "boolean")).to have(1).errors_on(:is_deleted)
  end

  it "is invalid without edited_at" do
    expect(FactoryGirl.build(:document, edited_at: nil)).to be_invalid
  end

  it "edited_at should be valid datetime format" do
    expect(FactoryGirl.build(:document, edited_at: "boolean")).to have(1).errors_on(:edited_at)
  end

  it "is invalid without user" do
    expect(FactoryGirl.build(:document, user_id: nil)).to be_invalid
  end

  it "does not allow duplicate documents per user" do
    FactoryGirl.create(:document)
    expect(FactoryGirl.build(:document)).to be_invalid
  end
end
