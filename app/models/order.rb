# frozen_string_literal: true

class Order < ApplicationRecord
  enum payment_method: %i[cash cashless]
  enum status: %i[not_adopted adopted ready delivered paid finished]
  belongs_to :address
  belongs_to :user
  has_many :order_products
  accepts_nested_attributes_for :order_products
end
