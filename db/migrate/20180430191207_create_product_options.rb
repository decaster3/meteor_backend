class CreateProductOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_options do |t|
      t.integer :option_category_option_id
      t.integer :option_category_id

      t.timestamps
    end
  end
end
