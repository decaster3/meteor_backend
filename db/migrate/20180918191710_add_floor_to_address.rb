class AddFloorToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :floor, :integer
    add_column :addresses, :entrance, :integer
    add_column :addresses, :intercom, :string
  end
end
