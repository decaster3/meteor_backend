class Topping < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  has_one_attached :image
  validates :image, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  validates :image, presence: true

  has_and_belongs_to_many :cities

  def self.all_attributes
    toppings = []
    Topping.all.each do |topping|
      if topping.image.attached?
        image_url = ImageUrl.img_url(topping.image)
      end
      toppings << {
        id: topping.id,
        name: topping.name,
        category_id: topping.category_id,
        image_url: image_url
      }
    end
    return toppings
  end
end
