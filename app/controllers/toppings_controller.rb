class ToppingsController < ApplicationController
  before_action :set_category
  before_action :set_topping, only: [:update, :destroy, :show]

  def index
    @toppings = Topping.all_attributes
    json_response(@toppings)
  end

  def show
    json_response(@topping)
  end

  def update
    @topping.update(topping_params)
    json_response @topping
  end

  def create
    @topping = Topping.new(topping_params)
    if @topping.save
      @category.toppings << @topping
      params[:cities_attributes].each do |city|
        City.find(city[:city_id]).toppings << @category
      end
    end
    json_response @category, :created
  end

  def destroy
    @topping.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_topping
    @topping = @category.toppings.find_by(id: params[:id]) if @category
  end

  def topping_params
    params.permit(:name)
  end

end
