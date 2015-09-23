require 'factory_girl'

FactoryGirl.define do
  factory :user_profile do
  	phone_no '1234567890' 
  	address 'bangalore, koramangla'
  	sex 'male' 
  	date_of_birth '29/04/1992'

  		user
  end
end