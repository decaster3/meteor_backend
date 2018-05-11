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
    puts "______-------__________------___-"
    puts product_instance_params
    # if @product_instance.save
    #   @product.product_instances << @product_instance
    #   params[:prices_attributes].each do |price|
    #     Price.create!(value: price[:value], city_id: price[:city_id], product_instance_id: @product_instance.id)
    #   end
      json_response @product, :created 
    # end
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
    params.require(:product_instance).permit(:product_id,
      option_values_attributes: [:value, :option_name_id],
      prices_attributes: [:value, :city_id])
  end
end
