class CreateCurriculumOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculum_offices do |t|
      t.string :name
      t.references :curriculum_category, foreign_key: true

      t.timestamps
    end
  end
end
