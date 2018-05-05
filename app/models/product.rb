class Product < ApplicationRecord
  has_many :product_instances
  has_many :option_names
  
  accepts_nested_attributes_for :option_names
end
