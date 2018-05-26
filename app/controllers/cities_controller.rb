# frozen_string_literal: true

class CitiesController < ApplicationController
  # before_action :set_country
  before_action :set_city, only: %i[update destroy show]

  def index
    @cities = City.all
    # user = User.last
    # user.
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
    city = City.new(city_params)
    if city.save
      json_response city, :created
    else
      json_response city
    end
  end

  def destroy
    @city.destroy
    head :no_content
  end

  private

  def city_params
    params.require(:city)
        .permit(
            :name,
            :currency,
            :country_id,
            :phone,
            schedule: %i[opens_at closes_at]
        )
  end

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_city
    @city = @country.cities.find_by(id: params[:id]) if @country
  end
end
