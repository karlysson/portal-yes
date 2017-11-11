class CreateCurriculumProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculum_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
