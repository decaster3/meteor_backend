class ProductOption < ApplicationRecord
  belongs_to :product_instance
  belongs_to :option_value


  def self.find_all_by_product_instance(product_instance, belongs)
    all = ProductOption.where(product_instance: product_instance.id).select do |po|
      po.option_value.option_name.is_belongs == belongs
    end
    pos = []
    all.map do |po|
      pos << OptionValue.find_all_by_product_option(po)
    end
    return pos
  end

  def self.find_all_belonging_by_product_instance(pi)
    find_all_by_product_instance(pi, true)
  end

  def self.find_all_not_belonging_by_product_instance(pi)
    find_all_by_product_instance(pi, false)
  end

end
