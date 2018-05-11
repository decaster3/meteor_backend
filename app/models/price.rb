class Price < ApplicationRecord
  validates :value, presence: true
  validates :value, length: { minimum: 2 }
  validate :is_product_instance_has_a_city

  belongs_to :city
  belongs_to :product_instance

  private
  def is_product_instance_has_a_city
    product_instance = ProductInstance.find(self.product_instance_id)
    product = Product.find(product_instance.product_id)
    unless product.cities.exists?(self.city_id)
      errors.add(:price, ": product_instance_id's product hasn't that city_id")
    end 
  end
end
