require 'factory_girl'

FactoryGirl.define do
	factory :book do
		title 'ruby on rails'
		price 350
		description 'book on ruby on rails'
		author 'avijit mandal'
			#associations
  		subject   
  		user
	end
end
