include Rails.application.routes.url_helpers
module ImageUrl
  extend ActiveSupport::Concern
  
  def self.img_url(img)
    rails_blob_path(img, only_path: true)
  end
end