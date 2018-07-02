class ProductOption < ApplicationRecord
  belongs_to :product_instance
  belongs_to :option_value
  has_one :option_name, through: :option_value

end
