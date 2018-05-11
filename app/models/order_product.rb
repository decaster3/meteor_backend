class OrderProduct < ApplicationRecord
  belongs_to :product_instance
  belongs_to :order
end
