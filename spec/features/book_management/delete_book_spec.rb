require "rails_helper"

RSpec.feature "Book Management", type: :feature, broken: true do
	include AuthHelper

	scenario "delete_book_content", js: true do
		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)

		signin_user(user)

		visit root_path

		# save_and_open_page

		click_link book.title

		expect{
			click_link 'Delete Book'
			expect(page).to have_content 'Are you sure you want to delete this item?'
			click_button 'OK'
			}.to change(Book, :count).by(-1)

	end
end