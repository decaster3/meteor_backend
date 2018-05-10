class ModifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string, null: false, default: ''
    add_index :users, :phone, unique: true

    # JWT ID column required by JTIMatcher revocation strategy of devise-jwt gem
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
  end
end
