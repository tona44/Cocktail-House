class RemoveMaterialFromCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :material, :string
    remove_column :cocktails, :quantity, :string
  end
end
