# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  enum role: %i[client admin]

  belongs_to :inviter, class_name: 'User', optional: true
  has_many :orders
  has_many :referals, class_name: 'User', foreign_key: 'inviter'
  has_many :meteors

  after_initialize :set_default_role, if: :new_record?
  after_initialize :set_token, if: :new_record?
  after_initialize :send_code, if: :new_record?

  MIN_EMAIL_LENGTH = 5
  MAX_EMAIL_LENGTH = 255

  MIN_PHONE_LENGTH = 5
  MAX_PHONE_LENGTH = 255

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable,
  # :rememberable, :omniauthable, and :trackable,
  devise :database_authenticatable,
         :registerable,
         # :confirmable,
         # :recoverable,
         :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  # validates :email,
  # uniqueness: true,
  # length: { minimum: MIN_EMAIL_LENGTH, maximum: MAX_EMAIL_LENGTH }

  validates :phone,
            presence: true,
            uniqueness: true,
            format: { with: /\A(\+[0-9]+)\z/i },
            length: { minimum: MIN_PHONE_LENGTH, maximum: MAX_PHONE_LENGTH }

  # attr_accessor :phone, :email
  # attr_accessor :confirmed_at
  # attr_accessor :inviter
  # attr_accessible :inviter

  def possible_to_send_sms?
    Time.now - confirmation_sent_at > 1.minute
  end

  def confirmed?
    !confirmed_at.nil?
  end

  def not_confirmed?
    confirmed_at.nil?
  end

  def confirm?(code)
    confirmation_code == code
  end

  def confirm
    self.confirmed_at = Time.now
    save
  end

  def self.create_default(phone, name)
    password = Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
    user = User.create!(name: name, phone: phone, password: password)
    print(user)
    user
  end

  def give_meteors(value, city, description = 'Add meteors')
    add_meteors(value, city, description)
    if orders.length < 2
      inviter&.add_meteors(50, city, "Начисление метеоров за приглашение участника #{name}")
    end
    inviter&.add_meteors((value * 0.5).to_i, city, "Начисление метеоров за зыказ, выполненный #{name}")
  end

  def add_meteors(value, city, description = 'Add meteors')
    meteors.create(value: value, description: description, city_id: city.id)
  end

  def subtract_meteors(value, city, description = 'Subtract meteors')
    add_meteors(-1 * value, city, description) if value != 0
  end

  def self.all_info(user)
    orders = user.orders.map do |order|
      {
        "id": order.id,
        "city_id": order.city.id,
        "currency": order.city.currency,
        "payment_method": order.payment_method,
        "total": order.total,
        "meteors": order.meteors,
        "amount": order.amount,
        "status": order.status,
        "created_at": order.created_at,
        "order_products": order.order_products.map do |order_product|
                            product = Product.form_product(
                              order_product.product_instance.product,
                              nil,
                              order,
                              order_product.product_instance.id
                            )
                            product[:count] = order_product.quantity
                            product
                          end
      }
    end
    {
      "id": user.id,
      "name": user.name,
      "token": user.token,
      "phone": user.phone,
      "role": user.role,
      "total_meteors": user.meteors.group(:city_id).sum(:value).map do |key, value|
                         {
                           "city_id": key,
                           "value": value
                         }
                       end,
      "meteors": user.meteors,
      "orders": orders
    }
  end

  def alexey_phone_format
    phone = self.phone
    if phone_valid?(phone)
      phone = "8(#{phone[2..4]})#{phone[5..7]}-#{phone[8..9]}-#{phone[10..11]}"
    end
    phone
  end

  private

  def set_default_role
    self.role ||= :client
  end

  def set_token
    self.token ||= Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
  end

  def send_code
    code = gen_code
    self.confirmation_code = code
    self.confirmation_sent_at = Time.now
    ## TODO Send sms logic goes here
  end

  def gen_code
    111_111
  end

  def phone_valid?(phone)
    phone.length == 12 && phone[1] == '7'
  end
  # def make order()
end
