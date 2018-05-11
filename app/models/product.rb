class Product < ApplicationRecord
  include ImageUrl
  validates :name, :description, presence: true
  validates :name, :description, uniqueness: true
  validates :name, length: {minimum: 2}
  validates :description, length: {minimum: 10}

  # has_one_attached :image
  # validates :image, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  # validates :image, presence: true

  has_and_belongs_to_many :cities

  belongs_to :category
  validates :category, presence: true

  has_many :product_instances
  has_and_belongs_to_many :subcategories

  after_initialize :init

  def init
    self.is_topping ||= false
  end

  def self.all_attributes
    all = []
    products = Product.all
    products.each do |product|
      instances = []
      product.product_instances.each do |instance|
        ProductOption.where(product_instance_id: instance.id).each do |option|
          prices = Price.where(product_instance_id: instance.id).map do |price|
            {
              value: price.value,
              currency: City.find(price.city_id).currency
            }
          end

          value = OptionValue.find(option.option_value_id)
          name = OptionName.find(value.option_name_id)
          instances << {
            prices: prices,
            option_name: name.name,
            option_value: value.value
          }
        end
      end

      # if product.image.attached?
      #   image_url = ImageUrl.img_url(product.image)
      # end

      all << {
        product: product,
        subcategories: product.subcategories,
        category: product.category,
        product_instances: instances,
        # image_url: image_url
      }
    end

    return all
  end
end
