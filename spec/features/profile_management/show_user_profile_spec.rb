require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper
	
	scenario "Add user profile details" do
		user = create(:user)
		user_profile = create(:user_profile, user: user)

		signin_user(user)

		visit root_path

		within '#user_nav' do
			click_link 'Profile'
		end

		expect(current_path).to eq(user_profile_path(user_profile))
		
		within '#user_profile' do
			expect(page).to have_content "Phone No.:- #{user_profile.phone_no}"
			expect(page).to have_content "Sex:- #{user_profile.sex}"
			expect(page).to have_content "Date of Birth:- #{user_profile.date_of_birth}"
			expect(page).to have_content "Address:- #{user_profile.address}"
		end
	end
end