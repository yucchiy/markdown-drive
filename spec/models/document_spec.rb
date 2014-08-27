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
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:document, user: user)
    expect(FactoryGirl.build(:document, user: user)).to be_invalid
  end

  describe "Document.create_with_dropbox_document_and_user!!" do
    it "create successfully with correct json response" do
      dropbox_document = JSON.parse <<JSON
{
    "is_deleted": true,
    "revision": 4,
    "rev": "40000000d",
    "thumb_exists": false,
    "bytes": 0,
    "modified": "Wed, 20 Jul 2011 22:41:09 +0000",
    "path": "/hi2",
    "is_dir": false,
    "icon": "page_white",
    "root": "app_folder",
    "mime_type": "application/octet-stream",
    "size": "0 bytes"
}
JSON

      user = FactoryGirl.create(:user)
      document = Document.create_with_dropbox_document_and_user!(dropbox_document, user)
      expect(document).to be_valid
    end

    it "create successfully without is_deleted" do
      dropbox_document = JSON.parse <<JSON
{
    "revision": 4,
    "rev": "40000000d",
    "thumb_exists": false,
    "bytes": 0,
    "modified": "Wed, 20 Jul 2011 22:41:09 +0000",
    "path": "/hi2",
    "is_dir": false,
    "icon": "page_white",
    "root": "app_folder",
    "mime_type": "application/octet-stream",
    "size": "0 bytes"
}
JSON

      user = FactoryGirl.create(:user)
      document = Document.create_with_dropbox_document_and_user!(dropbox_document, user)
      expect(document).to be_valid
      expect(document.is_deleted).to eq(false)
    end
  end

end
