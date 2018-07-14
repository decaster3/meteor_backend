class AddViewedColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :viewed, :boolean
  end
end
