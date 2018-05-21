class AddCategoryIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, foreign_key: {on_delete: :cascade}
  end
end
