class CreateJoinTableProductSubcategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :subcategories do |t|
      # t.index [:product_id, :subcategory_id]
      # t.index [:subcategory_id, :product_id]
    end
  end
end
