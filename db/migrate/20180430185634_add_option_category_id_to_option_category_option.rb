class AddOptionCategoryIdToOptionCategoryOption < ActiveRecord::Migration[5.2]
  def change
    add_column :option_category_options, :option_category_id, :integer
  end
end
