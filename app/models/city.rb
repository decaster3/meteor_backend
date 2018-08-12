# frozen_string_literal: true

class City < ApplicationRecord
  enum currency: %i[RUB KGS KZT JPY KOW тенге сом]

  belongs_to :country
  has_and_belongs_to_many :products
  has_many :product_instances, through: :prices
  has_many :orders, through: :addresses
  has_many :addresses
  has_many :meteors
end
