class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]

  # GET /countries
  def index
    @countries = Country.all
    render json: @countries
  end

  # GET /countries/1
  def show
    render json: @country
  end

  # POST /countries
  def create
    @country = Country.create(country_params)
    render json: @country, status: :created, location: @country
  end

  # PATCH/PUT /countries/1
  def update
    @country.update(country_params)
    render json: @country
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def country_params
    params.require(:country).permit(:name)
  end
end
