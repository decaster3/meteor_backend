class ProductInstancesController < ApplicationController
  before_action :set_product
  before_action :set_product_instance, only: [:update, :destroy, :show]

  def index
    @product_instances = ProductInstance.all
    json_response(@product_instances)
  end

  def show 
    json_response(@product_instance)
  end

  def create
    @product.product_instances.create!(product_instance_params)
    json_response @product, :created 
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_product_instance
    @product_instance = @product.product_instances.find_by(id: params[:id]).option_values if @product
  end

  def product_instance_params
    params.require(:product_instance).permit(
      option_values_attributes: [:value, :option_name_id])
  end

end
