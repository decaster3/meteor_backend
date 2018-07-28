# frozen_string_literal: true

class OrdersController < ApplicationController
  include Orderable

  before_action :set_order, only: %i[update destroy]

  # GET /orders
  def index
    index_logic

    render json: @orders
  end

  # GET /orders/1
  def show
    Order.includes(:user)
    Order.includes(:order_products)
    @order = Order.includes(
      :user,
      address: [
        :city
      ],
      order_products: [
        product_instance: [
          :product
        ]
      ]
    )
    json_order = {
      id: @order.id,
      status: @order.status,
      payment_method: @order.payment_method,
      created_at: @order.created_at,
      updated_at: @order.updated_at,
      delivery_time: @order.delivery_time,
      amount: @order.amount,
      meteors: @order.meteors,
      discount: (@order.amount / @order.total),
      comment: @order.address.comment,
      address: {
        id: @order.address.id,
        street: @order.address.street,
        building: @order.address.building,
        apartment: @order.address.apartment,
        city: @order.address.city.name
      },
      user: {
        id: @order.user.id,
        name: @order.user.name,
        phone: @order.user.phone
      }
    }
    json_response(json_order)
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
    render json: @order if @order.update(order_params)
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
