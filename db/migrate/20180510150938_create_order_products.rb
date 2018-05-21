class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.belongs_to :product_instance, foreign_key: {on_delete: :cascade}
      t.belongs_to :order, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
