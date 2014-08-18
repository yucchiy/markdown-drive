class User < ActiveRecord::Base
  has_many :identities
  
  def self.create_with_omniauth(auth)
    User.create do |user|
      user.name = auth.extra.raw_info.display_name
    end
  end
end
