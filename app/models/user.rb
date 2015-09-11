class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one :user_profile
   has_many :books

   def full_name
		first_name.present? ? "#{first_name} #{last_name}" : nil
	end

  validates :first_name, :presence => true
  validates :last_name, :presence => true
	
end
