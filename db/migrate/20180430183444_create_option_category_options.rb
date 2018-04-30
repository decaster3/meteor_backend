class CreateOptionCategoryOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :option_category_options do |t|
      t.string :value

      t.timestamps
    end
  end
end
