class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.boolean :private, null: false, default: false
      t.index :user_id
      
      t.timestamps
    end
  end
end
