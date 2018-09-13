# frozen_string_literal: true

class PromotionsController < ApplicationController
  before_action :authenticate
  before_action :admin_only, only: %i[update create destroy]
  before_action :set_promotion, only: %i[show update destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    city = City.find(params[:city_id])
    @promotions = Promotion.all_attributes(city)
    json_response @promotions
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show; end

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      json_response @promotion, :created
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    if params[:image]
      @promotion.image.attach(params[:image])
      json_response @promotion
    else
      @promotion.update(product_params)
      json_response @promotion
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def promotion_params
    params.require(:promotion).permit(
        :city_id,
        :description,
        :name,
    )
  end
end
