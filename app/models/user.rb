class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile
  has_one :image, as: :imageable

  has_many :books

  def full_name
		name.capitalize
	end

  validates :name, :presence => true

end
