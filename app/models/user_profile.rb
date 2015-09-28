class UserProfile < ActiveRecord::Base
	belongs_to :user
	has_many :books

	validates :phone_no, :presence =>{:message=>"please enter your phone no"}
	validates_length_of :phone_no, is: 10, :message=>"please enter a valid phone no with 10 digit"
	validates :sex, :presence =>  true
	validates :date_of_birth, :presence =>{:message=>"Please enter your date of birth"}
end
