class BookContent < ActiveRecord::Base
	belongs_to :book

	validates_presence_of :chapter, :message=>"Please enter a chapter name"

end
