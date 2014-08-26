class User < ActiveRecord::Base

  has_many :identities

  validates :name, :presence => true

  def self.create_with_omniauth(auth)
    User.create do |user|
      user.name = auth.extra.raw_info.display_name
    end
  end
end
