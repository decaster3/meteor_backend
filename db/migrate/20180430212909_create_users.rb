class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone, null: false, default: ''

      t.timestamps
    end
  end
end
