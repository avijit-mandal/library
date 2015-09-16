class Book < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	belongs_to :user_profile
	has_many :book_contents
	mount_uploader :cover_image, AvatarUploader
	validates_presence_of :title
 	validates_numericality_of :price, :message=>"Error Message"
 	validates_presence_of :description
end
