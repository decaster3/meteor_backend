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

  def self.define_city_from_order(order)
    order.city
  end

  def self.form_product(product, city = nil, order = nil, only = nil)
    city = define_city_from_order(order) if city.nil?
    image_url = nil
    image_url = ImageUrl.img_url(product.image) if product.image.attached?
    product_options = {}
    instances = []
    product.product_instances.each do |instance|
      next if !only.nil? && (instance.id != only)
      price = instance.prices.select { |p| p.city_id == city.id }[0]
      next unless price
      independent_options = []
      dependent_options = []
      instance.product_options.each do |product_option|
        unless product_options[product_option.option_name.id]
          product_options[product_option.option_name.id] = {
            id: product_option.option_name.id,
            name: product_option.option_name.name,
            is_characteristic: product_option.option_name.is_characteristic,
            option_values: []
          }
        end

        product_options[product_option.option_name.id][:option_values] << {
          id: product_option.option_value_id,
          value: product_option.option_value.value
        }
        if product_option.option_name.is_characteristic
          dependent_options << {
            value_id: product_option.option_value_id,
            value: product_option.option_value.value,
            option_id: product_option.option_name.id
          }
        else
          independent_options << {
            value_id: product_option.option_value_id,
            value: product_option.option_value.value,
            option_id: product_option.option_name.id
          }
        end
      end
      instances << {
        id: instance.id,
        independent_options: independent_options,
        dependent_options: dependent_options,
        price: {
          value: price.value,
          currency: city.currency
        }
      }
    end
    product_options.each do |_key, product_option|
      product_option[:option_values] = product_option[:option_values].uniq
    end
    options = product_options.values
    unless instances.empty?
      {
        name: product.name,
        id: product.id,
        description: product.description,
        subcategories: product.subcategories.map { |s| { id: s.id, name: s.name } },
        instances: instances,
        options: options,
        image_url: image_url
      }
    end
  end

  def self.all_attributes(city, category_id)
    all = []
    products = city.products.with_attached_image.includes(
      subcategories: [],
      product_instances: [
        :prices,
        product_options: %i[
          option_value
          option_name
        ]
      ]
    ).where(category_id: category_id)
    products.each do |product|
      product = form_product(product, city = city)
      if product
        all << product
      end
    end
    all
  end
end
