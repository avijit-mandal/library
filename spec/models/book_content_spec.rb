require 'rails_helper'

RSpec.describe BookContent, type: :model do
  it "is valid with user_id, book_id, chapter and chapter_content" do
  	book_content = BookContent.new(
  		user_id: "1",
  		book_id: '15',
  		chapter: 'chapter 1',
  		chapter_content: 'this is a spec test to cover codes with Rspec')
  	expect(book_content).to be_valid
  end
  
  	it { should validate_presence_of(:chapter) }
end
