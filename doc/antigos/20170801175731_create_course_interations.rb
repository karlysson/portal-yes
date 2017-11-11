class CreateCourseInterations < ActiveRecord::Migration[5.0]
  def change
    create_table :course_interations do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.string :page
      t.integer :page_id
      t.text :others

      t.timestamps
    end
  end
end
