class ChangeCurrencyColumnInCity < ActiveRecord::Migration[5.2]
  def change
    change_column :cities, :currency, :integer
  end
end
