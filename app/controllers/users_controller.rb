# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  # before_action :authenticate
  # before_action :admin_only

  # GET /users
  def index
    if params[:phone]
      @user = User.includes(
        :inviter
      ).find_by(phone: "+#{params[:phone].strip}")
      json_response(
        id: @user.id,
        name: @user.name,
        token: @user.token,
        phone: @user.alexey_phone_format,
        role: @user.role,
        inviter: {
          id: @user.inviter.id,
          name: @user.inviter.name,
          phone: @user.inviter.alexey_phone_format
        }
      )
    else
      :authenticate
      if current_user
        @user = User.includes(
          :inviter,
          :meteors,
          orders: [
            :city,
            order_products: [
              product_instance: [
                :prices,
                product: [
                  :subcategories,
                  product_instances: [
                    prices: [
                      :city
                    ],
                    product_options: %i[option_value option_name]
                  ]
                ]
              ]
            ]
          ]
        ).find(current_user.id)

        json_response(User.all_info(@user))
      else
        return render json: {
          error: 'Unauthorized.'
        }, status: 401
      end
    end
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
