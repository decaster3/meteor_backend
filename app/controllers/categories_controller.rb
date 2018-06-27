# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[update destroy show]

  def index
    @categories = Category.includes(:option_names).all
    render json: @categories,
           only: %i[id name],
           include: {
             option_names: {
               only: %i[id name is_characteristic]
             }
           }
  end

  def show
    json_response(@category)
  end

  def update
    @category.update(category_params)
    json_response @category
  end

  def create
    @category = Category.create!(category_params)
    json_response @category, :created
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name,
                                     option_names_attributes: [:name])
  end
end
