class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :name
      t.date :birth
      t.string :marital_status
      t.string :identity
      t.string :cpf
      t.string :elector_title
      t.string :inscription
      t.string :zone
      t.string :section
      t.string :cnh
      t.string :category_cnh
      t.string :professional_experience
      t.string :professional_preference
      t.string :email
      t.string :address
      t.string :street
      t.string :block
      t.string :lot
      t.string :sector
      t.references :city, foreign_key: true
      t.string :zip_code
      t.string :phone
      t.string :cell_phone
      t.string :message
      t.string :study
      t.string :teaching
      t.string :period
      t.string :courses
      t.string :employee
      t.string :salary
      t.string :father
      t.string :profession_father
      t.string :mother
      t.string :profession_mother

      t.timestamps
    end
  end
end
