class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cocktails, :description, true
    change_column_null :cocktails, :image, true
    change_column_null :cocktails, :recipe, true
    change_column_null :cocktails, :alcohol_degree, true
    change_column_null :cocktails, :recommendation, true
  end
end
