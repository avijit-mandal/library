require 'factory_girl'

FactoryGirl.define do
	factory :book do
		title 'ruby on rails'
		price 350
		subject_id '3'
		description 'book on ruby on rails'
		user_id '1'
		author 'avijit mandal'
	end
end