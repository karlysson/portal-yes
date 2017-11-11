class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :status
      t.string :name
      t.string :title
      t.text :summary
      t.text :description

      t.timestamps
    end
  end
end
