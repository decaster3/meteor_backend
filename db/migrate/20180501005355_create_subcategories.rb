class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
