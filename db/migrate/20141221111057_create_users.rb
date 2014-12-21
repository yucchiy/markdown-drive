class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :screen_name, null: false

      t.string :github_id, null: false
      t.string :github_token, null: false

      t.timestamps null: false
    end

    add_index :users, :screen_name, unique: true
    add_index :users, :github_id, unique: true
  end
end
