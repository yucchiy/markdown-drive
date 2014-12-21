class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }
  validates :screen_name, presence: true
  validates_uniqueness_of :screen_name
  validates :github_id, presence: true
  validates_uniqueness_of :github_id
  validates :github_token, presence: true
end
