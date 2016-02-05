FactoryGirl.define do
  factory :small_restaurant, class: "Restaurant" do
    capacity { rand(25) }
  end

  factory :restaurant, class: "Restaurant" do
    capacity 100
    name "testeraunt"
    address "123 fake street"
  end

  factory :restaurant_for_review, class: "Restaurant" do
    name "McDonald's"
  end

end
