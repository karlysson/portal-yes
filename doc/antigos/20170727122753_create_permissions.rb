class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :prefix
      t.text :obs

      t.timestamps
    end
  end
end
