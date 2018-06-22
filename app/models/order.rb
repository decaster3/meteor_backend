# frozen_string_literal: true

class Order < ApplicationRecord

  after_initialize :set_default_status
  after_create :give_meteors

  enum payment_method: %i[cash cashless]
  enum status: %i[not_adopted adopted ready delivered paid finished]
  belongs_to :address
  belongs_to :user
  has_many :order_products
  has_and_belongs_to_many :promotions
  accepts_nested_attributes_for :order_products

  def price
    order_products.reduce(0) do |sum, op|
      sum + op.product_instance.price * op.quantity
    end
  end

  private

  def set_default_status
    self.status = :not_adopted
  end

  def give_meteors
    self.user.add_meteors(self.price * 0.05, "Начисление метеоров за заказ №" + id.to_s)
  end

end
