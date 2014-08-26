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
end
