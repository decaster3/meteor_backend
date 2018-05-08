class Product < ApplicationRecord
  include ImageUrl
  validates :name, :description, presence: true, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 10 }

  has_one_attached :image
  validates :image, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  validates :image, presence: true
   
  belongs_to :category
  validates :category, presence: true

  has_many :product_instances
  has_many :option_names
  has_many :taggings
  has_many :subcategories, through: :taggings

  accepts_nested_attributes_for :option_names
  accepts_nested_attributes_for :subcategories

  def self.all_attributes
    all = []
    products = Product.all
    products.each do |product|
      instances = []
      product.product_instances.each do |instance|
        ProductOption.where(product_instance_id: instance.id).each do |option|
          value = OptionValue.find(option.option_value_id)
          name = OptionName.find(value.option_name_id)
          instances << {
            option_name: name.name,
            option_value: value.value
          }
        end
      end
      if product.image.attached?
        puts product.image.inspect
        image_url = ImageUrl.img_url(product.image)
      end
      all << {
        product: product,
        subcategories: product.subcategories,
        category: product.category,
        product_instances: instances,
        image_url: image_url
      }
    end
    return all
  end

end
