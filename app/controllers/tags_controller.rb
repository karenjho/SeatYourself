class TagsController < ApplicationController
  before_action :load_restaurant

  def create
    @tag = @restaurant.tags.build(tag_params)
    @tag.tagname.downcase!

    if @tag.save
      redirect_to restaurant_path(@restaurant)
    else
      render restaurant_path(@restaurant)
    end
  end

  def update
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:tagname)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
