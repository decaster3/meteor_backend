class CreateJoinTableProductCity < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :cities do |t|
      # t.index [:product_id, :city_id]
      # t.index [:city_id, :product_id]
    end
  end
end
