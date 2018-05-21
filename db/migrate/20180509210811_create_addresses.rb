class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :building
      t.string :apartment
      t.string :comment
      t.belongs_to :city, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end
end
