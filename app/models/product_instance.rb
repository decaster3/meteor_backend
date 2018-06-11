# frozen_string_literal: true

class ProductInstance < ApplicationRecord
  belongs_to :product
  has_many :product_options, dependent: :destroy
  has_many :option_values, through: :product_options, dependent: :destroy
  has_many :cities, through: :prices
  has_many :prices, dependent: :delete_all
  has_and_belongs_to_many :promotions
  accepts_nested_attributes_for :option_values
  accepts_nested_attributes_for :prices

  # private

  # #TODO improve this method
  # def is_product_instance_category_equal_to_option_value_category(attributes)
  #   category_id_of_option_value = OptionName.find(attributes[:option_name_id]).category_id
  #   errors.add(:product_instance, ': option_values is nil') if
  #       Category.find(category_id_of_option_value).nil?
  # end
  def price
    prices.first.value
  end

  def self.find_all_by_product(product, city)
    all = ProductInstance.where(product_id: product.id)
    pis = []
    all.map do |pi|
      price = Price.find_by(city_id: city.id, product_instance_id: pi.id)
      next if price.nil?
      pis << {
        id: pi.id,
        independent_options: ProductOption.find_all_independent_by_product_instance(pi),
        dependent_options: ProductOption.find_all_dependent_by_product_instance(pi),
        price: {
          value: price.value,
          currency: city.currency
        }
      }
    end
    pis
  end
end
