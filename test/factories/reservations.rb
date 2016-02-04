FactoryGirl.define do
  factory :reservation, class: "Reservation" do
    date_time Time.now
    party_size { rand(80) }
  end
end
