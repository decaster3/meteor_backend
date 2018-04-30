class OptionCategoriesController < ApplicationController
  before_action :set_option_category, only: [:show, :update, :destroy]

  # GET /option_categories
  def index
    @option_categories = OptionCategory.all

    render json: @option_categories
  end

  # GET /option_categories/1
  def show
    render json: @option_category
  end

  # POST /option_categories
  def create
    @option_category = OptionCategory.new(option_category_params)

    if @option_category.save
      render json: @option_category, status: :created, location: @option_category
    else
      render json: @option_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /option_categories/1
  def update
    if @option_category.update(option_category_params)
      render json: @option_category
    else
      render json: @option_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /option_categories/1
  def destroy
    @option_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_category
      @option_category = OptionCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_category_params
      params.require(:option_category).permit(:string)
    end
end
