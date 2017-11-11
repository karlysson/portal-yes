class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :title
      t.string :address
      t.string :phone
      t.string :email
      t.string :latitude
      t.string :longitude
      t.string :zip_code
      t.time :initial_care
      t.time :end_care
      t.time :initial_interval
      t.time :end_range
      t.string :md_facebook
      t.string :md_google
      t.string :md_twitter
      t.text :obs

      t.timestamps
    end
  end
end
