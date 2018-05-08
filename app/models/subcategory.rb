class Subcategory < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :category
  has_many :taggings
  has_many :products, through: :taggings
end
