require 'rails_helper'

RSpec.describe Book, type: :model do
	it 'has a valid factory' do
		expect(build(:book)).to be_valid
	end

	it { should validate_presence_of(:title).with_message('Please enter title of the book') }
	it { should validate_presence_of(:description).with_message('Please give a short Description') }
	it { should validate_numericality_of(:price).with_message('Put a valid numaric value') }
	it {should belong_to(:subject)}
	it {should have_many(:book_contents)}
	it {should belong_to(:user)}
	

	
end