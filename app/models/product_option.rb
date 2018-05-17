class ProductOption < ApplicationRecord
  belongs_to :product_instance
  belongs_to :option_value


  def self.find_all_by_product_instance(product_instance)
    all = ProductOption.where(product_instance: product_instance.id)
    pos = []
    all.map do |po|
      pos << OptionValue.find_all_by_product_option(po)
    end
    return pos
  end

end
