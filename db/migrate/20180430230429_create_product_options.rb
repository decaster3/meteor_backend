class CreateProductOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_options do |t|
      t.references :product_instance, foreign_key: {on_delete: :cascade}
      t.references :option_value, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
