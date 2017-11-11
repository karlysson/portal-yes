class AddStatusToBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :status, :string
    add_column :banners, :target, :string
  end
end
