class OptionName < ApplicationRecord
  has_many :option_values
  belongs_to :product
end
