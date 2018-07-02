# frozen_string_literal: true

class Product < ApplicationRecord
  include ImageUrl
  validates :name, :description, presence: true
  validates :is_topping, exclusion: { in: [nil] }
  validates :name, :description, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 10 }

  has_one_attached :image
  # validates :image, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  # validates :image, presence: true

  has_and_belongs_to_many :cities

  belongs_to :category
  validates :category, presence: true

  has_many :product_instances, inverse_of: :product
  has_many :prices, through: :product_instances, inverse_of: :product
  has_many :option_values, through: :product_instances, inverse_of: :products
  has_and_belongs_to_many :subcategories
  accepts_nested_attributes_for :product_instances
  accepts_nested_attributes_for :option_values
  accepts_nested_attributes_for :prices
  after_initialize :init

  def init
    self.is_topping ||= false
  end

  def self.all_attributes(city, category_id)
    all = []
    products = city.products.includes(:subcategories)
                   .select(:id, :name, :description, :category_id, :is_topping)
                   .where(category_id: category_id)
    products.each do |product|
      image_url = nil
      image_url = ImageUrl.img_url(product.image) if product.image.attached?
      instances = ProductInstance.find_all_by_product(product, city)
      option_values = []
      instances.each do |inst|
        option_values += inst[:independent_options]
        option_values += inst[:dependent_options]
      end
      all << {
        name: product.name,
        id: product.id,
        description: product.description,
        subcategories: product.subcategories,
        instances: instances,
        options: OptionName.find_all_by_category_id(category_id, option_values),
        image_url: image_url
      }
    end

    all
  end
end
