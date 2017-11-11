class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :course_category, foreign_key: true
      t.string :workload
      t.text :obs

      t.timestamps
    end
  end
end
