class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

      t.string :path
      t.string :rev
      t.integer :revision
      t.integer :bytes
      t.string :size
      t.boolean :is_deleted

      t.references :user

      t.timestamp :edited_at
      t.timestamps
    end

    add_index :documents, [:user_id, :path], unique: true
  end
end
