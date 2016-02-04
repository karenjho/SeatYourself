class ReviewsController < ApplicationController
  before_action :load_review, only: [:show, :edit, :update, :destroy]
  before_action :load_restaurant

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.review.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def load_review
    @review = Review.find(params[:id])
  end

end
