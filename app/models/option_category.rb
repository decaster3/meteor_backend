class OptionCategory < ApplicationRecord
  has_many :option_category_options
  has_and_belongs_to_many :product_options
end
