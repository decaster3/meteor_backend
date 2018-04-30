# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :name

  validates :phone, presence: true, length: { minimum: 8, maximum: 255 }
  validates :password, presence: true, length: { minimum: 8, maximum: 255 }

  has_secure_password
end
