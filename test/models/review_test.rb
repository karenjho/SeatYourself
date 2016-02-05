require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @restaurant = FactoryGirl.create(:restaurant_for_review)
    @review = FactoryGirl.create(:review)
  end

end
