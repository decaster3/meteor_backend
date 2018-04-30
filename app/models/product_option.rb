class ProductOption < ApplicationRecord
  has_and_belongs_to_many :option_categories
  has_and_belongs_to_many :option_category_options
  belongs_to :products
end
