# frozen_string_literal: true

class AddIsBelongsToOptionName < ActiveRecord::Migration[5.2]
  def change
    add_column :option_names, :is_belongs, :boolean, default: false, null: false
  end
end