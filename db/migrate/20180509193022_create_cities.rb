class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.json :schedule
      t.references :country, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
