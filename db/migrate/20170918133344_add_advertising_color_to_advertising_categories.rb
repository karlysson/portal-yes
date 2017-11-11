class AddAdvertisingColorToAdvertisingCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :advertising_categories, :color, :string
  end
end
