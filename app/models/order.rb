class Order < ApplicationRecord
  enum payment_method: [ :cash, :cashless ]
  enum status: [ :not_adopted, :adopted, :ready, :delivered, :paid ]
  belongs_to :address
end
