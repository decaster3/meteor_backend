# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )

  attr_accessor :phone, :email

  validates :phone, presence: true, length: { minimum: 8, maximum: 255 }
  validates :password, presence: true, length: { minimum: 8, maximum: 255 }

  has_secure_password
end
