class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one :user_profile
   has_many :books

   def full_name
		first_name.present? ? "#{first_name.capitalize} #{last_name.capitalize}" : nil
	end

  validates :first_name, :presence => true
  validates :last_name, :presence => true
	
end
