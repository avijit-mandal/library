require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    password "12345678"
  end

end
