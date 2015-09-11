require 'rails_helper'

describe Book do
	it 'is valid with title, price, subject_id, description' do
		sub = Subject.new
		book = Book.new(
			title: "Advance Physics",
			price: 350,
			# subject_id: find_by_sql {"SELECT sub.id FROM subjects WHERE sub.name = 'physics'"},
			description: "Advance studu of physics")
		expect(book).to be_valid
	end


	it 'is not valisd without title' do
		expect(Book.new(title: nil)).to have(1).error_on(:title)
	end

	it 'is not valisd without price' do
	expect(Book.new(price: nil)).to have(1).error_on(:price)
	end 


	it 'is not valisd without description' do
	expect(Book.new(description: nil)).to have(1).error_on(:description)
	end
	
end