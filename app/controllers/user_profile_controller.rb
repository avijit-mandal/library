class UserProfileController < ApplicationController
	before_filter :authenticate_user!

	def new
		@user_profile = UserProfile.new
	end

	def create
		@user_profile = UserProfile.new(user_params)
		if @user_profile.save
			redirect_to user_profile_path(@user_profile)
		else
			render 'new'
		end
	end

	def show
		@user_profile = UserProfile.find(params[:id])
	end

	def edit
      @user_profile = UserProfile.find(params[:id]) 
	end

	def update
    	@user_profile = UserProfile.find(params[:id])

    	if @user_profile.update_attributes(user_params)
        	redirect_to user_profile_path(@user_profile)
    	else
        	render edit_user_profile_path(@user_profile)
      	end
	end

	private

		def user_params
			params.require(:user_profile).permit(:user_id, :first_name, :last_name, :phone_no, :sex, :date_of_birth, :address)
		end


end
