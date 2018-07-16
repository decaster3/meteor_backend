class AddCityToMeteor < ActiveRecord::Migration[5.2]
  def change
    add_reference :meteors, :city, foreign_key: true
  end
end
