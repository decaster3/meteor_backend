class CreateJoinTablePromotionOrder < ActiveRecord::Migration[5.2]
  def change
    create_join_table :promotions, :orders do |t|
      # t.index [:promotion_id, :order_id]
      # t.index [:order_id, :promotion_id]
    end
  end
end
