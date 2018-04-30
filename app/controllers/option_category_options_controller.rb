class OptionCategoryOptionsController < ApplicationController
  before_action :set_option_category_option, only: [:show, :update, :destroy]

  # GET /option_category_options
  def index
    @option_category_options = OptionCategoryOption.all

    render json: @option_category_options
  end

  # GET /option_category_options/1
  def show
    render json: @option_category_option
  end

  # POST /option_category_options
  def create
    @option_category_option = OptionCategoryOption.new(option_category_option_params)

    if @option_category_option.save
      render json: @option_category_option, status: :created, location: @option_category_option
    else
      render json: @option_category_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /option_category_options/1
  def update
    if @option_category_option.update(option_category_option_params)
      render json: @option_category_option
    else
      render json: @option_category_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /option_category_options/1
  def destroy
    @option_category_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_category_option
      @option_category_option = OptionCategoryOption.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_category_option_params
      params.require(:option_category_option).permit(:string)
    end
end
