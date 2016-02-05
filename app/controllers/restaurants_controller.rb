class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all

    if params[:search]
      @restaurants = Restaurant.where(name: params[:search]).order(created_at: :desc)
    else
      @restaurants = Restaurant.all.order(created_at: :desc)
    end
  end

  def show
    if current_user
      @review = @restaurant.reviews.build
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_user

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :address, :phone, :url, :photo_url, :owner_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
