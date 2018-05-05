class ProductInstance < ApplicationRecord
  belongs_to :product
  has_many :product_options
  has_many :option_values, through: :product_options
  accepts_nested_attributes_for :option_values
end
