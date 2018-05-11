class Price < ApplicationRecord
  validates :value, presence: true
  validates :value, length: {minimum: 2}
  # validate :check_, :on => :create

  belongs_to :city
  belongs_to :product_instance
end
