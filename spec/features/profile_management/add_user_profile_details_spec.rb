require "rails_helper"

RSpec.feature "Book Management" do
	include AuthHelper
	
	scenario "Add user profile details" do
		user = create(:user)

		signin_user(user)

		visit root_path

		within '#user_nav' do
			click_link 'Add Details'
		end
		
		expect{
			within '#add_user_profile_details' do
				fill_in 'Phone No', with: '8759684303'
				fill_in 'Date of Birth', with: '29/04/1992'
				choose('user_profile_sex_male') #use id
				fill_in 'Address', with: 'bangalore, karnataka'
				click_button 'Save'
			end
		}.to change(UserProfile, :count).by(1)

		expect(current_path).to eq(user_profile_path(user.user_profile.id))
	end
end