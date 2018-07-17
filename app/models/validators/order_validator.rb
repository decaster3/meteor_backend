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
    puts "meteors"
    puts meteors
    puts record.meteors
    puts "meteors"
    if record.meteors > meteors
      record.errors[:base] <<
          "Does not have enough meteors(#{meteors}, #{record.meteors})"
    end
  end
end