# frozen_string_literal: true

class CitiesController < ApplicationController
  # before_action :set_country
  before_action :set_city, only: %i[update destroy show]

  def index
    @cities = City.all
    json_response(@cities)
  end

  def show
    json_response(@city)
  end

  def update
    @city.update(city_params)
    json_response @city
  end

  def create
    city = City.create!(city_params)
    json_response city, :created
  end

  def destroy
    @city.destroy
    head :no_content
  end

  private

  def city_params
    params.permit(:name, :currency, :schedule)
  end

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_city
    @city = @country.cities.find_by(id: params[:id]) if @country
  end
end
