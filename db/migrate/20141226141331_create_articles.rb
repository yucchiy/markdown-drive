class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content
      t.text :path
      t.references :user
      t.timestamp :edited_at

      t.timestamps null: false
    end

    add_index :articles, :title
    add_index :articles, :path
    add_index :articles, :user_id
  end
end
