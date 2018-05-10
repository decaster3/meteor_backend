class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  # GET /cities
  def index
    @cities = City.all

    render json: @cities
  end

  # GET /cities/1
  def show
    render json: @city
  end

  # POST /cities
  def create
    @city = City.create(city_params)
    render json: @city, status: :created, location: @city
  end

  # PATCH/PUT /cities/1
  def update
    @city.update(city_params)
    render json: @city
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def city_params
    params.require(:city).permit(:name, :schedule, :country_id)
  end
end
