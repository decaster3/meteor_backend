class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string, null: false, default: ''
    add_index :users, :phone, unique: true
  end
end
