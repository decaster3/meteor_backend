class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.string :value
      t.references :city, foreign_key: { on_delete: :nullify }
      t.references :product_instance, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
