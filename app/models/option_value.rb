# frozen_string_literal: true

class OptionValue < ApplicationRecord
  validates :value, presence: true
  validates :value, length: {minimum: 1}

  belongs_to :option_name
  has_many :product_instances
  has_many :product_instances, through: :product_options
  has_many :products, through: :product_instances

end
