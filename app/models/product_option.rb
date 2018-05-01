class ProductOption < ApplicationRecord
  belongs_to :product_instance
  belongs_to :option_value
end
