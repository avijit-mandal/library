require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper

	scenario "display_book_details" do
		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)

		signin_user(user)

		visit root_path

		click_link book.title

		expect(page).to have_content book.title
		expect(page).to have_content "Author: #{book.author}"
		expect(page).to have_content "Price: $#{book.price}"
		expect(page).to have_content "Subject: #{book.subject.name}"
		expect(page).to have_content "Description: #{book.description}"
		
			
	end
end
