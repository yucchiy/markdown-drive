class Document < ActiveRecord::Base

  belongs_to :user

  validates :path, :presence => true
  validates :rev, :presence => true
  validates :revision, :presence => true
  validates :bytes, :presence => true
  validates :size, :presence => true
  validates :is_deleted, :inclusion => { in: [true, false] }
  validates :edited_at, :presence => true
  validates :user, :presence => true
  validates :user_id, :uniqueness => { scope: [:path] }

  def self.create_with_dropbox_document_and_user!(dropbox_document, user)
    self
    .where("path = ?", dropbox_document["path"])
    .where("user_id = ?", user.id)
    .first_or_create! do |document|
      document.user = user
      document.path = dropbox_document["path"]
      document.revision = dropbox_document["revision"]
      document.rev = dropbox_document["rev"]
      document.is_deleted = dropbox_document["is_deleted"] || false
      document.size = dropbox_document["size"]
      document.bytes = dropbox_document["bytes"]
      document.edited_at = dropbox_document["modified"]
    end
  end
end
