class Product < ApplicationRecord
  include ImageUrl
  validates :name, :description, presence: true
  validates :is_topping, exclusion: { in: [nil] }
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

  def self.all_attributes(city, category_id)
    all = []
    products = city.products
                   .select(:id, :name, :description, :category_id, :is_topping)
                   .where(category_id: category_id)
    products.each do |product|

      # if product.image.attached?
      #   image_url = ImageUrl.img_url(product.image)
      # end

      all << {
        name: product.name,
        id: product.id,
        description: product.description,
        subcategories: product.subcategories,
        instances: ProductInstance.find_all_by_product(product, city),
        options: OptionName.find_all_by_category_id(category_id)
        # image_url: image_url
      }
    end

    return all
  end
end
