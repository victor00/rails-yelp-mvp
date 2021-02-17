class RestaurantsController < ApplicationController
  before_action :find, only: %i[show]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def show; end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def find
    @restaurant = Restaurant.find(params[:id])
  end
end
