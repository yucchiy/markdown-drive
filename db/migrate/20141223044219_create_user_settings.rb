class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|
      t.string :repository
      t.references :user
      t.timestamps null: false
    end

    add_index :user_settings, :user_id
  end
end
