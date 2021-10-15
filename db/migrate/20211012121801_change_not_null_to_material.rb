class ChangeNotNullToMaterial < ActiveRecord::Migration[5.2]
  def change
    change_column_null :materials, :name, true
    change_column_null :materials, :quantity, true
  end
end
