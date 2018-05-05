class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :taggings
  has_many :products, through: :taggings
end
