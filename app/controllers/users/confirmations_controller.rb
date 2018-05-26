# frozen_string_literal: true

class ConfirmationsController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    if current_user.confirm? confirmation_params
      current_user.confirm
      if current_user.nil?
        render json: {
          error: 'User not found'
        }, status: 410
      else
        render json: {
          name: current_user.name,
          phone: current_user.phone,
          id: current_user.id,
          role: current_user.role,
          token: current_user.token
        }
      end
    else
      render json: { error: 'invalid code' }, status: 422
    end
  end

  private

  def confirmation_params
    params.require(:confirmation_code)
  end
end
