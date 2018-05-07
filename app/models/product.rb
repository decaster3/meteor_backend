class Product < ApplicationRecord
  belongs_to :category
  has_many :product_instances
  has_many :option_names
  has_many :taggings
  has_many :subcategories, through: :taggings
  accepts_nested_attributes_for :option_names
  accepts_nested_attributes_for :subcategories

  def self.all_attributes
    products = Product.all
    all = products.map do |product|
      instances = []
      product.product_instances.each do |instance|
        options = ProductOption.where(product_instance_id: instance.id)
        options.each do |option|
          value = OptionValue.find(option.option_value_id)
          name = OptionName.find(value.option_name_id)
          instances << {
            option_name: name.name,
            option_value: value.value
          }
        end
      end
      return {
        product: product,
        subcategories: product.subcategories,
        category: product.category,
        product_instances: instances
      }
    end
    return all
  end

end
