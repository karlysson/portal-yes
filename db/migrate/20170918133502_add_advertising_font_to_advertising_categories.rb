class AddAdvertisingFontToAdvertisingCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :advertising_categories, :font, :string
  end
end
