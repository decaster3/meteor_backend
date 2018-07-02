# frozen_string_literal: true

class OptionName < ApplicationRecord
  validates :name, presence: true
  validates :is_characteristic, exclusion: { in: [nil] }
  validates :name, length: { minimum: 2 }

  has_many :option_values
  belongs_to :category

end
