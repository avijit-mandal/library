class UserProfile < ActiveRecord::Base
	belongs_to :user
	has_many :books

	mount_uploader :profile_image, AvatarUploader

	validates :phone_no, :presence =>{:message=>"please enter your phone no"}
	validates :sex, :presence =>  true
	validates :date_of_birth, :presence =>{:message=>"Please enter your date of birth"}
end
