class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy, :show]

  def index
    @products = Product.all
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
    @product = Product.create!(product_params)
    print product_params
    json_response @product, :created 
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
    params.require(:product).permit(:name, :description, :category_id,
      subcategories_attributes: [:subcategory, :category_id],
      option_names_attributes: [:name])
  end
end
