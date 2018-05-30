class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.belongs_to :city, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
