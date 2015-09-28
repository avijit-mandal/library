require "rails_helper"

RSpec.feature "Book Management" do
	
	scenario "User sign up" do

		visit root_path

		within '#user_nav' do
			click_link 'Sign up'
		end
		fill_in 'First name', with: 'avijit'
		fill_in 'Last name', with: 'mandl'
		fill_in 'Email', with: 'avijit.mandal@gmail.com'
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'

		click_button 'Sign up'

		within '#user_nav' do
			expect(page).to have_content 'Add Details'
		end
	end
end