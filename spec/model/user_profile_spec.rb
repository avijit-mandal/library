require "rails_helper"



describe UserProfile do

	it "is valid with a phone_no, sex and date_of_birth" do
		userprofile = UserProfile.new(
		phone_no: '8792208196',
		sex: 'male',
		date_of_birth: '1992-04-29')
		
		expect(userprofile).to be_valid
	end

	it "is invalid without a phone_no" do
		expect(UserProfile.new(phone_no: nil)).to have(1).errors_on(:phone_no)
	end

	it "is invalid without a sex" do
		expect(UserProfile.new(sex: nil)).to have(1).error_on(:sex)
	end
	# using shoulda-matcher
	it { should validate_presence_of(:date_of_birth) }


end
