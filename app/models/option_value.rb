# frozen_string_literal: true

class OptionValue < ApplicationRecord
  validates :value, presence: true
  validates :value, length: {minimum: 1}

  belongs_to :option_name
  has_many :product_instances
  has_many :product_instances, through: :product_options
  has_many :products, through: :product_instances

  def self.find_all_by_product_option(product_option)
    ov = product_option.option_value
    {
        value_id: ov.id,
        value: ov.value,
        option_id: ov.option_name_id
    }
  end

  def self.find_all_distinct_by_option_name(on, option_values)
    ovs = []
    ovalues = []
    option_values.each do |opv|
      if opv[:option_id] == on.id && !ovalues.include?(opv[:value])
        ovs << opv
        ovalues << opv[:value]
      end
    end
    ovs.map do |ov|
      {
          value: ov[:value],
          id: ov[:value_id]
      }
    end
  end
end
