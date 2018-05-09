class SubcategoriesController < ApplicationController
  before_action :set_category
  before_action :set_subcategory, only: [:update, :destroy, :show]

  def index
    @subcategories = Subcategory.all
    json_response(@subcategories)
  end

  def show 
    json_response(@subcategory)
  end

  def update
    @subcategory.update(subcategory_params)
    json_response @subcategory
  end

  def create
    @category.subcategories.create!(subcategory_params)
    json_response @category, :created 
  end

  def destroy
    @subcategory.destroy
    head :no_content
  end

  private

  def subcategory_params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_subcategory
    @subcategory = @category.subcategories.find_by(id: params[:id]) if @category
  end

end
