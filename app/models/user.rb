# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  enum role: %i[client admin]

  has_many :orders


  after_initialize :set_default_role, if: :new_record?

  MIN_EMAIL_LENGTH = 5
  MAX_EMAIL_LENGTH = 255

  MIN_PHONE_LENGTH = 5
  MAX_PHONE_LENGTH = 255

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable,
  # :rememberable, :omniauthable, and :trackable,
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  # validates :email,
  #           presence: true,
  #           uniqueness: true,
  #           length: { minimum: MIN_EMAIL_LENGTH, maximum: MAX_EMAIL_LENGTH }

  # validates :phone,
  #           presence: true,
  #           uniqueness: true,
  #           length: { minimum: MIN_PHONE_LENGTH, maximum: MAX_PHONE_LENGTH }

  # attr_accessor :phone, :email

  private

  def set_default_role
    self.role ||= :client
  end
end
