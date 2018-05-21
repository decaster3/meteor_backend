class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment_method
      t.integer :status
      t.belongs_to :address, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end
end
