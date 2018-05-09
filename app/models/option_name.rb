class OptionName < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  has_one :option_values
  belongs_to :category
end
