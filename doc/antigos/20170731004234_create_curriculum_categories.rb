class CreateCurriculumCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculum_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
