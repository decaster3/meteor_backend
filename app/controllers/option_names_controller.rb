class OptionNamesController < ApplicationController
  before_action :set_option_name, only: [:show, :update, :destroy]

  # GET /option_names
  def index
    @option_names = OptionName.all

    render json: @option_names
  end

  # GET /option_names/1
  def show
    render json: @option_name
  end

  # POST /option_names
  def create
    @option_name = OptionName.new(option_name_params)

    if @option_name.save
      render json: @option_name, status: :created, location: @option_name
    else
      render json: @option_name.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /option_names/1
  def update
    if @option_name.update(option_name_params)
      render json: @option_name
    else
      render json: @option_name.errors, status: :unprocessable_entity
    end
  end

  # DELETE /option_names/1
  def destroy
    @option_name.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_name
      @option_name = OptionName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_name_params
      params.require(:option_name).permit(:name)
    end
end
