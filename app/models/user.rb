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
            format: {with: /\A(\+[0-9]+)\z/i},
            length: {minimum: MIN_PHONE_LENGTH, maximum: MAX_PHONE_LENGTH}

  # attr_accessor :phone, :email
  # attr_accessor :confirmed_at
  # attr_accessor :inviter
  # attr_accessible :inviter

  def verified?
    !confirmed_at.nil?
  end

  def verify
    self.confirmed_at = Time.now
    save
  end

  def possible_to_send_sms?
    Time.now - confirmation_sent_at > 2.seconds
  end

  def confirmed?
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
    user = User.create!(name: name, phone: phone, password: password, confirmed_at: Time.now - 1.day)
    print(user)
    return user
  end

  def add_meteors(value, description = 'Add meteors')
    meteors.create(value: value, description: description)
  end

  def subtract_meteors(value, description = 'Subtract meteors')
    add_meteors(-1 * value, description)
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
    ## Send sms logic goes here
  end

  def gen_code
    111_111
  end

  # def make order()
end
