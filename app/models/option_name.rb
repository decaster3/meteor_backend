
class OptionName < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  has_one :option_value
  belongs_to :category
end
