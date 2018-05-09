class RemoveProductIdFromOptionName < ActiveRecord::Migration[5.2]
  def change
    remove_column :option_names, :product_id, :integer
  end
end
