require "rails_helper"



describe UserProfile do

	# using FactoryGirl 
	it "has a valid factory" do
		expect(create(:user_profile)).to be_valid
	end

	it "is invalid without a phone_no" do
		expect(build(:user_profile, phone_no: nil)).to have(1).errors_on(:phone_no)
	end

	#Using dynamic assignment
	it "is invalid without a sex" do
		expect(UserProfile.new(sex: nil)).to have(1).error_on(:sex)
	end


	# using shoulda-matcher
	it { should validate_presence_of(:date_of_birth).with_message('Please enter your date of birth') }


end
