class Book < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	has_many :book_contents
	has_one :image, as: :imageable
	validates_presence_of :title , :message=>"Please enter title of the book"
 	validates_numericality_of :price, :message=>"Put a valid numaric value", :allow_nil => true
 	validates_presence_of :description, :message=>"Please give a short Description"
end
