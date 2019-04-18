# frozen_string_literal: true

module Orderable
  extend ActiveSupport::Concern

  def show_logic
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
    ).find(params[:id])
    @order = construct_order(@order)
  end

  def index_logic
    order_models = if params.key?(:not_adopted)
                     Order.includes(
                       :user,
                       address: [
                         :city
                       ],
                       order_products: [
                         product_instance: [
                           :product
                         ]
                       ]
                     ).where(status: 'not_adopted')
                   else
                     Order.includes(
                       :user,
                       address: [
                         :city
                       ],
                       order_products: [
                         product_instance: [
                           :product
                         ]
                       ]
                     ).all
                   end
    @orders = order_models.map do |om|
      construct_order(om)
    end
  end

  def create_logic
    # params[:order][:user_id] = current_user.id if current_user
    unless params[:order][:delivery_time].nil?
      params[:order][:delivery_time] = Time.at(params[:order][:delivery_time])
    end
    if params[:user][:phone] && params[:user][:name]
      if (u = User.find_by_phone(params[:user][:phone]))
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
  end

  def construct_order(order)
    {
      id: order.id,
      status: order[:status],
      payment_method: order.payment_method,
      created_at: order.created_at,
      updated_at: order.updated_at,
      delivery_time: order.delivery_time,
      amount: order.amount,
      meteors: order.meteors,
      discount: (order.amount / order.total),
      comment: order.address.comment,
      city_id: order.address.city.id,
      address: {
        id: order.address.id,
        street: order.address.street,
        building: order.address.building,
        apartment: order.address.apartment,
        city: order.address.city.name
      },
      user: {
        id: order.user.id,
        name: order.user.name,
        phone: order.user.alexey_phone_format
      },
      products: order.order_products.each.map do |op|
                  {
                    barcode: op.product_instance.barcode,
                    quantity: op.quantity,
                    price: op.product_instance.price
                  }
                end
    }
  end
end
