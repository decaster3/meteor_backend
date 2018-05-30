class AddGoogleKeyColumnToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :google_key, :string
  end
end
