class ProductInstancesController < ApplicationController
  before_action :set_product_instance, only: [:show, :update, :destroy]

  # GET /product_instances
  def index
    @product_instances = ProductInstance.all

    render json: @product_instances
  end

  # GET /product_instances/1
  def show
    render json: @product_instance
  end

  # POST /product_instances
  def create
    @product_instance = ProductInstance.new(product_instance_params)

    if @product_instance.save
      render json: @product_instance, status: :created, location: @product_instance
    else
      render json: @product_instance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_instances/1
  def update
    if @product_instance.update(product_instance_params)
      render json: @product_instance
    else
      render json: @product_instance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_instances/1
  def destroy
    @product_instance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_instance
      @product_instance = ProductInstance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_instance_params
      params.require(:product_instance).permit(:product_id)
    end
end
