require 'factory_girl'

FactoryGirl.define do
	factory :book_content do
		chapter 'chapter 1'
		chapter_content 'this is for test perpose. No content is here right now'

		book
	end
end