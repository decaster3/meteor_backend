# frozen_string_literal: true

class OrdersController < ApplicationController
  include Orderable
  before_action :authenticate
  before_action :set_order, only: %i[update destroy]

  # GET /orders
  def index
    index_logic

    render json: @orders
  end

  # GET /orders/1
  def show
    show_logic
    json_response(@order)
  end

  # POST /orders
  def create
    create_logic
    json_response @order, :created
  end

  # PATCH/PUT /orders/1
  def update
    if @order.status == 'finished'
      return render json: { error: 'Not allowed to edit finished order.' }, status: 405
    end
    render json: @order if @order.update!(order_params)
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    # params[:delivery_time] = Time.now unless params[:delivery_time]
    params.require(:order).permit(
      :meteors,
      :amount,
      :payment_method,
      :status,
      :delivery_time,
      :address_id,
      :user_id,
      order_products_attributes: %i[quantity product_instance_id]
    )
  end

  def address_params
    params.require(:address)
          .permit(:street, :building, :apartment, :comment, :city_id)
  end
end
