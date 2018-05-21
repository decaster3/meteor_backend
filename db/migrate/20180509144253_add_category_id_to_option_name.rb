class AddCategoryIdToOptionName < ActiveRecord::Migration[5.2]
  def change
    add_reference :option_names, :category, foreign_key: {on_delete: :cascade}
  end
end
