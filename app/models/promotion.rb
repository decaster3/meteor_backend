class Promotion < ApplicationRecord
  include ImageUrl

  belongs_to :city
  has_one_attached :image

  def self.all_attributes(city)
    all = []
    promotions = city.promotions.with_attached_image
    promotions.each do |promotion|
      promotion = form_promotion(promotion)
      if promotion
        all << promotion
      end
    end
    all
  end

  def self.form_promotion(promotion)
    image_url = nil
    image_url = ImageUrl.img_url(promotion.image) if promotion.image.attached?
    {
        id: promotion.id,
        city_id: promotion.city_id,
        image_url: image_url,
        description: promotion.description,
        name: promotion.name
    }
  end
end
