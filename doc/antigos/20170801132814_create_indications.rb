class CreateIndications < ActiveRecord::Migration[5.0]
  def change
    create_table :indications do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :page
      t.integer :page_id
      t.string :phone
      t.string :profession
      t.string :obs

      t.timestamps
    end
  end
end
