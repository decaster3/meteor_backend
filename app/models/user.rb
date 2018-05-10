# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable,
  # :rememberable, :omniauthable, and :trackable,
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 255}
  validates :phone, presence: true, uniqueness: true, length: {minimum: 5, maximum: 255}

  # attr_accessor :phone, :email
end
