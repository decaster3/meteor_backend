class OptionValue < ApplicationRecord
  belongs_to :option_name
  has_many :product_instances
  has_many :product_instances, through: :product_options
end
