class AddPhoneColumnToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :phone, :string
  end
end
