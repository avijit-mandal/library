require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper

	scenario "edit_book_details" do
		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)

		signin_user(user)

		visit root_path

		click_link book.title

		expect{
			click_link 'Edit Book Details'
			within('#edit_book') do
				fill_in 'Author', with: 'avijit'

				click_button 'Save changes'
			end
		}.to change(Book, :count).by(0)

		expect(page).to have_content "Author: avijit"
	end
end

