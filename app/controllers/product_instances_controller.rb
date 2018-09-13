# frozen_string_literal: true

class ProductInstancesController < ApplicationController
  before_action :authenticate
  before_action :admin_only, only: %i[create destroy]

  before_action :set_product
  before_action :set_product_instance, only: %i[destroy show]

  def index
    @product_instances = ProductInstance.all
    json_response(@product_instances)
  end

  def show
    json_response(@product_instance)
  end

  def create
    @product_instance = @product.product_instances
                                .create(product_instance_params)
    json_response @product_instance, :created
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
      option_values_attributes: %i[value option_name_id],
      prices_attributes: %i[value city_id]
    )
  end
end
