class OptionName < ApplicationRecord
  has_one :option_values
  belongs_to :product
end
