class CreateWebhookEvents < ActiveRecord::Migration
  def change
    create_table :webhook_events do |t|
      t.references :user
      t.string :github_delivery_id
      t.string :ref
      t.string :head_commit_id
      t.text :payload_json

      t.timestamps null: false
    end

    add_index :webhook_events, :user_id
  end
end
