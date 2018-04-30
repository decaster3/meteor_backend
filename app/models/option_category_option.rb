class OptionCategoryOption < ApplicationRecord
  belongs_to :option_category
  has_and_belongs_to_many :product_options
end
