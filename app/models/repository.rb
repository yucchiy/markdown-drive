class Repository < ActiveRecord::Base
  belongs_to :user
  has_many :webhook_event

  validates_associated :user
  validates_presence_of :user
end
