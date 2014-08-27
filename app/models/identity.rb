class Identity < ActiveRecord::Base

  belongs_to :user

  validates :username, :presence => true
  validates :uid, :presence => true
  validates :provider, :presence => true, inclusion: { in: ["dropbox"] }
  validates :user, :presence => true
  validates :provider, :uniqueness => { scope: :uid }

  def self.with_omniauth!(auth)
    identity = where(auth.slice(:provider, :uid)).first_or_create! do |identity|
      identity.provider = auth.provider.parameterize.underscore.to_sym
      identity.uid = auth.uid
      identity.username = auth.extra.raw_info.display_name
    end

    identity.update_attributes!(:access_token => auth.credentials.token)
    return identity
  end

  def self.get_with_user_and_provider(user, provider)
    self
    .where("user_id = ?", user.id)
    .where("provider = ?", provider)
    .first
  end
end
