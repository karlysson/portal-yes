class CreateCompanyCategoryRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :company_category_relationships do |t|
      t.references :company, foreign_key: true
      t.references :company_category, foreign_key: true

      t.timestamps
    end
  end
end
