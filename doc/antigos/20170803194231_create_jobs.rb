class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.references :company, foreign_key: true
      t.string :status
      t.references :curriculum_profile, foreign_key: true
      t.references :curriculum_office, foreign_key: true
      t.integer :number
      t.string :location
      t.string :teaching
      t.string :cnh
      t.string :travel
      t.string :availability
      t.string :visible
      t.text :description
      t.text :benefit

      t.timestamps
    end
  end
end
