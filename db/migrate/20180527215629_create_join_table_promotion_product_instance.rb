class CreateJoinTablePromotionProductInstance < ActiveRecord::Migration[5.2]
  def change
    create_join_table :promotions, :product_instances do |t|
      # t.index [:promotion_id, :product_instance_id]
      # t.index [:product_instance_id, :promotion_id]
    end
  end
end
