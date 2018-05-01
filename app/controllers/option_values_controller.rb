class OptionValuesController < ApplicationController
  before_action :set_option_value, only: [:show, :update, :destroy]

  # GET /option_values
  def index
    @option_values = OptionValue.all

    render json: @option_values
  end

  # GET /option_values/1
  def show
    render json: @option_value
  end

  # POST /option_values
  def create
    @option_value = OptionValue.new(option_value_params)

    if @option_value.save
      render json: @option_value, status: :created, location: @option_value
    else
      render json: @option_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /option_values/1
  def update
    if @option_value.update(option_value_params)
      render json: @option_value
    else
      render json: @option_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /option_values/1
  def destroy
    @option_value.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_value
      @option_value = OptionValue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_value_params
      params.require(:option_value).permit(:value, :option_name_id)
    end
end
