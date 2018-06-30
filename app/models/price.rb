# frozen_string_literal: true

class Price < ApplicationRecord
  validates :value, presence: true
  validates :value, length: { minimum: 1 }
  # validate :product_instance_has_a_city?

  belongs_to :city
  belongs_to :product_instance, inverse_of: :prices
  private

  def product_instance_has_a_city?
    product_instance = ProductInstance.find(product_instance_id)
    product = Product.find(product_instance.product_id)
    unless product.cities.exists?(city_id)
      errors.add(
        :price,
        ": product_instance_id's product hasn't that city_id"
      )
    end
  end
end
