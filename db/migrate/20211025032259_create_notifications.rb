class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
      create_table :notifications do |t|
      t.integer :user_id, null: false
      t.integer :cocktail_id
      t.integer :from_user_id, null: false
      t.string :comment
      t.integer :variety, null: false
      t.boolean :checked, default: false
      t.timestamps
    end
    
    add_index :notifications, :user_id

  end
end
