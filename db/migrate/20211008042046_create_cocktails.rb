class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.string :image, null: false
      t.string :material, null: false
      t.string :quantity, null: false
      t.string :recipe, null: false
      t.string :base, null: false
      t.string :taste, null: false
      t.string :alcohol_degree, null: false
      t.string :recommendation, null: false
      
      t.timestamps
    end
  end
end
