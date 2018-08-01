require 'validators/order_validator'
# frozen_string_literal: true

class Order < ApplicationRecord
  validates_with OrderValidator
  before_update :update_meteors

  def self.percent_rate
    0.05
  end

  after_initialize :set_default_status, :set_default_delivery_time, if: :new_record?
  # after_create :give_meteors

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

  def update_meteors
    if (status_was != 'finished') && (status == 'finished')
      give_meteors
      subtract_meteors
    end
  end

  def set_default_status
    self.status = :not_adopted
  end

  def set_default_delivery_time
    self.delivery_time = delivery_time.nil? ? Time.now : delivery_time
  end

  def give_meteors
    user.give_meteors(
        (amount * Order.percent_rate).to_i,
        city,
        'Начисление метеоров за заказ №' + id.to_s
    )
  end

  def subtract_meteors
    user.subtract_meteors(
        meteors,
        city,
        'Списание метеоров за заказ №' + id.to_s
    )
  end
end
