# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy show]
  before_action :admin_only, only: %i[create update destroy]

  def index
    @products = Product.all_attributes
    json_response(@products)
  end

  def show
    json_response(@product)
  end

  def update
    @product.update(product_params)
    json_response @product
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
    params.require(:product).permit(:name, :description, :category_id, :is_topping)
  end
end
