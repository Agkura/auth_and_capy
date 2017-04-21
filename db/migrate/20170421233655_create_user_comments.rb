class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.integer :page_owner_id, null: false
      t.integer :author_id, null: false
      t.text :body, null: false
      t.index :page_owner_id
      t.index :author_id

      t.timestamps
    end
  end
end
