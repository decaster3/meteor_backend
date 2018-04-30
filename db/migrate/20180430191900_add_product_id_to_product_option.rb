class AddProductIdToProductOption < ActiveRecord::Migration[5.2]
  def change
    add_column :product_options, :product_id, :integer
  end
end
