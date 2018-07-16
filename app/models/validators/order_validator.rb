class OrderValidator < ActiveModel::Validator
  def validate(record)
    if record.meteors + record.amount != record.total
      record.errors[:base] <<
        "Different values. meteors(#{record.meteors}) + amount(#{record.amount}) != total(#{record.total})"
    end
  end
end