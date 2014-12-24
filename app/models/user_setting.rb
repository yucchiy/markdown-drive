class UserSetting < ActiveRecord::Base
  belongs_to :user

  validates_associated :user
  validates_presence_of :user
end
