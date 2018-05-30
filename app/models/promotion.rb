class Promotion < ApplicationRecord
  belongs_to :city
  has_and_belongs_to_many :product_instances
  has_and_belongs_to_many :orders
end
