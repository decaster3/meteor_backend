# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy show]
  # before_action :admin_only, only: %i[create update destroy]

  def index
    city = City.find(params[:city_id])
    @products = Product.all_attributes(city, params[:category_id])
    json_response(@products)
  end

  def show
    json_response(@product)
  end

  def update
    if params[:image]
      @product.image.attach(params[:image])
    else
      @product.update(product_params)
      json_response @product
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:cities_attributes].each do |city|
        City.find(city[:city_id]).products << @product
      end

      params[:subcategories_attributes].each do |subcategory|
        Subcategory.find(subcategory[:subcategory_id]).products << @product
      end

      json_response @product, :created
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
        :name, :description, :category_id, :is_topping,
        product_instances_attributes: [
            prices_attributes: %i[value city_id],
            option_values_attributes: %i[id]
        ]
    )
  end
end
