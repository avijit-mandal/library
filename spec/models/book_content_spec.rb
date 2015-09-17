require 'rails_helper'

RSpec.describe BookContent, type: :model do
	
  it 'has a valid factory' do
  	expect(build(:book_content)).to be_valid
  end
  
  	it { should validate_presence_of(:chapter).with_message('Please enter a chapter name') }
end
