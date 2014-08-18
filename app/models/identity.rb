class Identity < ActiveRecord::Base
  belongs_to :user

  def self.with_omniauth!(auth)
    identity = where(auth.slice(:provider, :uid)).first_or_create! do |identity|
      identity.provider = auth.provider
      identity.uid = auth.uid
      identity.username = auth.extra.raw_info.display_name
    end

    identity.update_attributes!(:access_token => auth.credentials.token)
    return identity
  end
end
