class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :github_repository_id
      t.string :name
      t.string :full_name
      t.string :master_branch
      t.references :user

      t.timestamps null: false
    end

    add_index :repositories, :github_repository_id, unique: true
  end
end
