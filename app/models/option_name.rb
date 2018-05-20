# frozen_string_literal: true

class OptionName < ApplicationRecord
  validates :name, presence: true
  validates :is_belongs, exclusion: { in: [nil] }
  validates :name, length: { minimum: 2 }

  has_many :option_values
  belongs_to :category

  def self.find_all_by_category_id(category_id, belongs)
    result = []
    all = OptionName.where(category_id: category_id, is_belongs: belongs)
    all.map do |on|
      # ovs = OptionValue.select(:value).where(option_name_id: on.id)
      result << {
        id: on.id,
        name: on.name,
        is_belongs: on.is_belongs,
        option_values: OptionValue.find_all_distinct_by_option_name(on)
      }
    end
    result
  end

  def self.find_all_belonging_by_category_id(category_id)
    find_all_by_category_id(category_id, true)
  end

  def self.find_all_not_belonging_by_category_id(category_id)
    find_all_by_category_id(category_id, false)
  end
end
