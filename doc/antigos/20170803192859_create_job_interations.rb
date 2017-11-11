class CreateJobInterations < ActiveRecord::Migration[5.0]
  def change
    create_table :job_interations do |t|
      t.string :page
      t.string :page_id
      t.references :job, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
