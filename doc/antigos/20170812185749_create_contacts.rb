class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :status
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.text :messege

      t.timestamps
    end
  end
end
