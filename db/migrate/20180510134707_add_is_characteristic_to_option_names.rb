class AddIsCharacteristicToOptionNames < ActiveRecord::Migration[5.2]
  def change
    add_column :option_names, :is_characteristic, :boolean
  end
end
