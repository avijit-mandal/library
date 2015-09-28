require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper

	scenario "edit_book_content" do
		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)
		
		signin_user(user)

		visit root_path

		click_link book.title
		
		click_link 'Edit Book Content'

		expect{
			click_link 'Add New Chapter'

			within('#new_chapter') do
				fill_in 'Chapter Name', with: 'chapter test'
				fill_in 'Chapter Content', with: 'this chapter is only for testing perpose'

				click_button 'Add chapter'
			end
		}.to change(BookContent, :count).by(1)
		expect(page).to have_content "Book Name: #{book.title}"
		expect(page).to have_content "chapter test"
		expect(page).to have_content "this chapter is only for testing perpose"
	end
end