class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates_associated :user
  validates_presence_of :user
end
