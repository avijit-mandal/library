class Subject < ActiveRecord::Base
	has_many :books
	has_many :book_contents
end
