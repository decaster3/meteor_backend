class CreateJoinTableCityTopping < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cities, :toppings do |t|
      # t.index [:city_id, :topping_id]
      # t.index [:topping_id, :city_id]
    end
  end
end
