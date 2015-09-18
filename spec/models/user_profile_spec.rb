require "rails_helper"

describe UserProfile do

	# using FactoryGirl 
	it "has a valid factory" do
		expect(create(:user_profile)).to be_valid
	end

	#Using dynamic assignment
	it "is invalid without a sex" do
		expect(UserProfile.new(sex: nil)).to have(1).error_on(:sex)
	end


	# using shoulda-matcher
	it { should validate_presence_of(:date_of_birth).with_message('Please enter your date of birth') }
	it { should validate_presence_of(:sex) }
	it { should validate_presence_of(:phone_no).with_message('please enter your phone no')}

	it "has a valid length", :broken do 
		should validate_length_of(:phone_no).is_is_equal_to(10).with_message('please enter a valid phone no with 10 digit')
	end
	
	it { should belong_to(:user)}

end
