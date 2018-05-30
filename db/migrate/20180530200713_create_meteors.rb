class CreateMeteors < ActiveRecord::Migration[5.2]
  def change
    create_table :meteors do |t|
      t.float :value
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
