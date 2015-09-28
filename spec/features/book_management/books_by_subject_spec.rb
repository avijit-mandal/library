require "rails_helper"

RSpec.feature "Book Management", type: :feature do
	include AuthHelper

	scenario "display_books_by_subject" do
		user = create(:user)
		subject = create(:subject)
		book = create(:book, user: user, subject: subject)

		signin_user(user)

		visit root_path

		click_link subject.name

		within('#books_per_subject') do
			expect(page).to have_content "#{subject.name}"
			expect(page).to have_content "#{book.title}"
		end
	end
end