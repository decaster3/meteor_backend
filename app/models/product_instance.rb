class ProductInstance < ApplicationRecord
  belongs_to :product
  has_many :product_options
  has_many :option_values, through: :product_options
  has_many :cities, through: :prices
  accepts_nested_attributes_for :option_values, reject_if: :is_product_instance_category_equal_to_option_value_category

  private

  def is_product_instance_category_equal_to_option_value_category(attributes)
    category_id_of_option_value = OptionName.find(attributes[:option_name_id]).category_id
    Category.find(category_id_of_option_value).nil?
  end
end