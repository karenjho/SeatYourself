FactoryGirl.define do
  factory :user, class: "User" do
    username "tester"
    password "password"
    password_confirmation "password"
  end
end
