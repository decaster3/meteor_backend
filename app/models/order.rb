require 'validators/order_validator'
# frozen_string_literal: true

class Order < ApplicationRecord
  validates_with OrderValidator

  def self.percent_rate
    0.05
  end

  after_initialize :set_default_status
  after_create :give_meteors

  enum payment_method: %i[cash cashless]
  enum status: %i[not_adopted adopted ready cancelled finished]
  belongs_to :address
  belongs_to :user
  has_one :city, through: :address
  has_many :order_products
  has_and_belongs_to_many :promotions
  accepts_nested_attributes_for :order_products

  def total
    order_products.reduce(0) do |sum, op|
      sum + op.product_instance.price * op.quantity
    end
  end

  private

  def set_default_status
    self.status = :not_adopted
  end

  def give_meteors
    user.add_meteors(
      (amount * Order.percent_rate).to_i,
      city,
      'Начисление метеоров за заказ №' + id.to_s
    )
  end
end
