class AddIsToppingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_topping, :boolean
  end
end
