require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper
	
	scenario "Add a new book" do
		user = create(:user)

		signin_user(user)

		visit root_path

		expect{
			click_link 'Add new Book'

			# save_and_open_page

			within('#new_book') do
				fill_in 'book[title]', with: 'abcd'
				fill_in 'Author', with: 'ifvif'
				fill_in 'book[description]', with: 'db cdijn dbiudc'

				click_button 'Add Book'
			end
		}.to change(Book, :count).by(1)

		expect(page).to have_content 'abcd'
	end
end