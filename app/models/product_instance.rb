class ProductInstance < ApplicationRecord
  belongs_to :product
  has_many :option_values, through: :product_options
end
