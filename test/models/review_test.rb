require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @restaurant = FactoryGirl.create(:restaurant_for_review)
    @review = FactoryGirl.create(:review)
  end

  test "create a review" do
    assert @review
  end

  test "review belongs to user" do
    @review = FactoryGirl.create(:review, user: @user)
    assert @user, @review.user
  end

  test "review belongs to restaurant" do
    @review = FactoryGirl.create(:review, restaurant: @restaurant)
    assert @restaurant, @review.restaurant
  end

  test "restaurant has many reviews" do
    @review = @restaurant.reviews.build(comment: "test")
    @review2 = @restaurant.reviews.build(comment: "test2")
    assert 2, @restaurant.reviews.count
  end

  test "user has many reviews" do
    @review = @user.reviews.build(comment: "test")
    @review2 = @user.reviews.build(comment: "test2")
    assert 2, @user.reviews.count
  end

end
