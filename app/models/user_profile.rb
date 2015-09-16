class UserProfile < ActiveRecord::Base
	belongs_to :user
	has_many :books

	mount_uploader :profile_image, AvatarUploader

	validates_presence_of :phone_no #:message=>"Must enter your phone no"
	validates :sex, :presence =>  true
	validates :date_of_birth, :presence => true
end
