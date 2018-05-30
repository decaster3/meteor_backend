# frozen_string_literal: true

class Order < ApplicationRecord
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

end
