class Product < ApplicationRecord
  belongs_to :category
  has_many :product_instances
  has_many :option_names
  has_many :taggings
  has_many :subcategories, through: :taggings
  accepts_nested_attributes_for :option_names
  accepts_nested_attributes_for :subcategories
end
