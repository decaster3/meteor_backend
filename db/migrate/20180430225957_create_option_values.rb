# frozen_string_literal: true

class CreateOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :option_values do |t|
      t.string :value
      t.references :option_name, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
