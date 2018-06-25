# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate
  # before_action :admin_only

  # GET /users
  def index
    @user = User.includes(
        :meteors,
        orders: [
            order_products: [
                product_instance: [
                    :product,
                    prices: [
                        :city
                    ],
                    product_options: [
                        :option_value,
                        :option_name
                    ],
                ]
            ]
        ]
    ).find(current_user.id)

    render json: @user, only: %i[id name token phone role],
           include: [
               :meteors,
               orders: {
                   only: %i[id payment_method status],
                   include: {
                       order_products: {
                           only: %i[id quantity],
                           include: {
                               product_instance: {
                                   only: [:id],
                                   include: {
                                       product: {
                                           only: %i[id name description]
                                       },
                                       product_options: {
                                           only: %i[],
                                           include: {
                                               option_value: {
                                                   only: %i[id value]
                                               },
                                               option_name: {
                                                   only: %i[id name is_characteristic]
                                               }
                                           }
                                       },
                                       prices: {
                                           only: %i[value],
                                           include: {
                                               city: {
                                                   only: %i[currency]
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }
                   }
               }
           ]
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     render json: @user, status: :created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /users/1
  # def destroy
  #   @user.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params
        .require(:user)
        .permit(:phone, :email)
  end
end
