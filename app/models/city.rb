class City < ApplicationRecord
  belongs_to :country
  has_many :products
  has_many :addresses
end
