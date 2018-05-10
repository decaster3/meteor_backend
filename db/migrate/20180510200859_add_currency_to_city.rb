class AddCurrencyToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :currency, :string
  end
end
