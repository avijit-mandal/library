require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper

	scenario "edit_chapter" do
		

		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)
		book_content = create(:book_content, user_id: user.id, book: book)

		signin_user(user)

		visit root_path

		click_link book.title

		click_link 'Edit Book Content'

		click_link "#{book_content.chapter}"

		
		expect{
			click_link 'Edit chapter content'

			within('#edit_chapter') do
				fill_in 'Chapter Name', with: 'edited chapter'
				fill_in 'Chapter Content', with: 'edited Chapter Content'

				click_button 'Save chapter' 
			end
		}.to change(Book, :count).by(0)
		
		expect(page).to have_content 'edited chapter'
		expect(page).to have_content 'edited Chapter Content'
	end
end