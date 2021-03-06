class OrderValidator < ActiveModel::Validator
  def validate(record)
    meteors_plus_amount_equal_total(record)
    user_have_enough_meteors(record)
  end

  def meteors_plus_amount_equal_total(record)
    if record.meteors + record.amount != record.total
      record.errors[:base] <<
          "Different values. meteors(#{record.meteors}) + amount(#{record.amount}) != total(#{record.total})"
    end
  end

  def user_have_enough_meteors(record)
    meteors = record.user.meteors.group(:city_id).sum(:value)[record.city.id] || 0
    if record.meteors > meteors
      record.errors[:base] <<
          "Does not have enough meteors(#{meteors}, #{record.meteors})"
    end
  end

  def delivery_time_future_time(record)
    if record.delivery_time > Time.now
      record.errors[:base] <<
          "Impossible to send order to the past"
    end
  end
end