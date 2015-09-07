class Book < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	validates_presence_of :title
 	validates_numericality_of :price, :message=>"Error Message"
end
