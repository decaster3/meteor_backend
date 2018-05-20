# frozen_string_literal: true

class OptionValue < ApplicationRecord
  validates :value, presence: true
  validates :value, length: { minimum: 1 }

  belongs_to :option_name
  has_many :product_instances
  has_many :product_instances, through: :product_options

  def self.find_all_by_product_option(product_option)
    ov = product_option.option_value
    {
      option_value: ov.value,
      option_name: ov.option_name.name
    }
  end

  def self.find_all_distinct_by_option_name(on)
    on.option_values.select(:value).distinct.map do |ov|
      {
        value: ov.value
      }
    end
  end
end
