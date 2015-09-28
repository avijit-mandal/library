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
		
		expect{
			click_link 'Edit'

			within '#edit_user_profile_details' do
				fill_in 'Phone No', with: '8759684303'
				fill_in 'Address', with: 'Bankura, West Bengal'
				click_button 'Save Changes'
			end
		}.to change(UserProfile, :count).by(0)

		expect(current_path).to eq(user_profile_path(user_profile))

		expect(page).to have_content 'Phone No.:- 8759684303'
		expect(page).to have_content 'Address:- Bankura, West Bengal'
	end
end