require 'date'

class SmsValidation < ApplicationRecord

  after_initialize :send_code

  def self.valid?(code)
    if :expires_at < Time.now
      errors.add(:sms_validation, ': Code expired')
    end
    if :code != code
      errors.add(:sms_validation, ': Invalid code')
    end
    errors.length > 0
  end

  def send_code()
    self.code = generate_code
    puts self.code
  end

  def generate_code()
    111_111
  end

end
