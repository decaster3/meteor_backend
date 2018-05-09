class Category < ApplicationRecord
  validates :name, presence: true
  has_many :subcategories
  has_many :option_names
  has_many :toppings
  accepts_nested_attributes_for :option_names
end
