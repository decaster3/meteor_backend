module Validate
  class ProductInstance
    include ActiveModel::Validations

    attr_accessor :prices_attributes

    validates :prices_attributes, presence: true
  
    def initialize(params={})
      @city_id = params[:latitude]
      @product_id = params[:longitude]
      ActionController::Parameters.new(params).permit(:latitude,:longitude)
    end

  end
end