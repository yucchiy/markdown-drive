class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }
  validates :screen_name, presence: true
  validates_uniqueness_of :screen_name
  validates :github_id, presence: true
  validates_uniqueness_of :github_id
  validates :github_token, presence: true

  def self.find_or_create_by_auth_hash(auth_hash)
    User.find_or_create_by(github_id: auth_hash['uid']) do |user|
      user.name = auth_hash['info']['name']
      user.screen_name = auth_hash['info']['nickname']
      user.github_id = auth_hash['uid']
      user.github_token = auth_hash['credentials']['token']
    end
  end
end
