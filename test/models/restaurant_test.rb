require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = FactoryGirl.create(:restaurant)
    @time = Time.now
    @time2 = @time.advance(hours: 2)
  end

  test "restaurant is available" do
    assert @restaurant.available?(10, @time)
  end

  test "restaurant is not available" do
    assert_not @restaurant.available?(200, @time)
  end

  test "restaurant is available for party_size of 0" do
    assert_not @restaurant.available?(0, @time)
  end

  test "restaurant is available given a reservation" do
    FactoryGirl.create(:reservation, party_size: 10, restaurant: @restaurant)
    assert @restaurant.available?(80, @time)
  end

  test "restaurant is not available given a reservation" do
    FactoryGirl.create(:reservation, party_size: 99, restaurant: @restaurant)
    assert_not @restaurant.available?(10, @time)
  end

  test "restaurant is available with reservations at different times" do
    FactoryGirl.create(:reservation, restaurant: @restaurant, date_time: @time, party_size: 99)
    assert @restaurant.available?(10, @time2)
  end

  test "restaurant is not available with overlapping reservations" do
    FactoryGirl.create(:reservation, restaurant: @restaurant, date_time: @time, party_size: 60)
    assert_not @restaurant.available?(60, @time)
  end

  test "restaurant is assigned a rating" do
    @restaurant.reviews.build(comment: "test", rating: 1)
    @restaurant.reviews.build(comment: "test", rating: 3)
    @restaurant.reviews.build(comment: "test", rating: 5)
    assert 3, @restaurant.rating(@restaurant)
  end

end
