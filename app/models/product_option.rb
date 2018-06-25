class ProductOption < ApplicationRecord
  belongs_to :product_instance
  belongs_to :option_value
  has_one :option_name, through: :option_value


  def self.find_all_by_product_instance(product_instance, belongs)
    all = ProductOption.where(product_instance: product_instance.id).select do |po|
      po.option_value.option_name.is_characteristic == belongs
    end
    pos = []
    all.map do |po|
      pos << OptionValue.find_all_by_product_option(po)
    end
    return pos
  end

  def self.find_all_independent_by_product_instance(pi)
    find_all_by_product_instance(pi, false)
  end

  def self.find_all_dependent_by_product_instance(pi)
    find_all_by_product_instance(pi, true)
  end

end
