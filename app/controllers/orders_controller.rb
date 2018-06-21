# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    # params[:order][:user_id] = current_user.id if current_user
    if params[:user][:phone] && params[:user][:name]
      if u = User.find_by_phone(params[:user][:phone])
        params[:order][:user_id] = u.id
      else
        def_user = User.create_default(
            params[:user][:phone],
            params[:user][:name]
        )
        params[:order][:user_id] = def_user.id
      end
    end
    unless params[:address].nil?
      address = Address.create!(address_params)
      params[:order][:address_id] = address.id
    end
    order_params_instance = order_params
    @order = Order.create!(order_params_instance)
    json_response @order, :created
  end

  # PATCH/PUT /orders/1
  def update
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
      :payment_method,
      :status,
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
