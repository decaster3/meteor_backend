# frozen_string_literal: true

class ProductInstance < ApplicationRecord
  belongs_to :product
  has_many :product_options
  has_many :option_values, through: :product_options
  has_many :cities, through: :prices
  has_many :prices
  accepts_nested_attributes_for :option_values
  accepts_nested_attributes_for :prices

  # private

  # #TODO improve this method
  # def is_product_instance_category_equal_to_option_value_category(attributes)
  #   category_id_of_option_value = OptionName.find(attributes[:option_name_id]).category_id
  #   errors.add(:product_instance, ': option_values is nil') if
  #       Category.find(category_id_of_option_value).nil?
  # end
end
