class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy, :show]

  def index
    @categories = Category.all
    json_response(@categories)
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
