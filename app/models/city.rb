class City < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :products
  has_many :product_instances, through: :prices
end