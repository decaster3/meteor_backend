class OptionValuesController < ApplicationController
  before_action :set_option_value, only: :show
  def index
    @option_values = OptionValue.all
    json_response(@option_values)
  end

  def show
    json_response(@option_value)
  end

  def set_option_value
    @product = @product.product_instances.find_by(id: params[:product_id])
      .product_instances.find_by(id: params[:product_instance_id]) if @product
  end
end
