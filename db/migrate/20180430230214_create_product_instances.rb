class CreateProductInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :product_instances do |t|
      t.references :product, foreign_key: {on_delete: :cascade}
      t.string :external_id, null: false

      t.timestamps
    end
    add_index :product_instances, :external_id, unique: true
  end
end
