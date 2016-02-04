FactoryGirl.define do
  factory :small_restaurant, class: "Restaurant" do
    capacity { rand(25) }
  end

  factory :restaurant, class: "Restaurant" do
    capacity 100
  end

  factory :restaurant_for_review, class: "Restaurant" do
    name "McDonald's"
  end

end
