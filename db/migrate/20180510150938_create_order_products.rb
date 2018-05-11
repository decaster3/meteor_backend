class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.belongs_to :product_instance, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
