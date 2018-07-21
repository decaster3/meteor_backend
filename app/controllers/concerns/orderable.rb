# frozen_string_literal: true

module Orderable
  extend ActiveSupport::Concern

  def index_logic
    @orders = if params[:not_adopted].nil?
                Order.all
              else
                Order.where(status: 'not_adopted')
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
end
