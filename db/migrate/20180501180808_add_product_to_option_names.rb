class AddProductToOptionNames < ActiveRecord::Migration[5.2]
  def change
    add_reference :option_names, :product, foreign_key: true
  end
end
