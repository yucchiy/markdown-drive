class Identity < ActiveRecord::Base
  belongs_to :user

  def self.with_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |identity|
      identity.provider = auth.provide
      identity.uid = auth.uid
      identity.username = auth.username
    end
  end
end
