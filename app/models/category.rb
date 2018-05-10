class Category < ApplicationRecord
  validates :name, presence: true
  has_many :subcategories
  has_many :option_names
  has_many :toppings
  has_many :products
  accepts_nested_attributes_for :option_names
end
