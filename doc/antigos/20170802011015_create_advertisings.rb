class CreateAdvertisings < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisings do |t|
      t.string :name
      t.text :description
      t.references :advertising_category, foreign_key: true
      t.references :company, foreign_key: true
      t.string :address
      t.string :phone
      t.string :email
      t.string :site
      t.string :choice
      t.string :facebook
      t.string :instragram
      t.string :twitter
      t.string :google

      t.timestamps
    end
  end
end
