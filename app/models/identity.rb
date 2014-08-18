class Identity < ActiveRecord::Base
  belongs_to :user

  def self.with_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |identity|
      identity.provider = auth.provider
      identity.uid = auth.uid
      identity.username = auth.extra.raw_info.display_name
    end
  end
end
