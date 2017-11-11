class AddStatusToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :status, :string
  end
end
