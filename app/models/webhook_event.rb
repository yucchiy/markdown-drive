class WebhookEvent < ActiveRecord::Base
  belongs_to :repository

  validates :github_delivery_id, presence: true
  validates :ref, presence: true
  validates :head_commit_id, presence: true
  validates :payload_json, presence: true
  validates_associated :repository
  validates_presence_of :repository

  def payload
    Oj.load(self.payload_json, :compat => true)
  end
end
