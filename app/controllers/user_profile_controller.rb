class UserProfileController < ApplicationController
	before_filter :authenticate_user!
	

	def new
		@user_profile = UserProfile.new
	end

	def create
		
		@user_profile = UserProfile.new(user_params)
		@user_profile.profile_image = params[:profile_image]
		@user_profile.user_id = current_user.id
		if @user_profile.save
			redirect_to user_profile_path(@user_profile)
		else
			render 'new'
		end
	end

	def show
		@uploader = AvatarUploader.new

		@user_profile = UserProfile.find(params[:id])
	end

	def edit
      @user_profile = UserProfile.find(params[:id]) 
	end

	def update
		
    	@user_profile = UserProfile.find(params[:id])
    	@user_profile.profile_image = params[:profile_image]

    	if @user_profile.update_attributes(user_params)
        	redirect_to user_profile_path(@user_profile)
    	else
        	render :action => 'edit'
      	end
	end

	private

		def user_params
			params.require(:user_profile).permit(:user_id, :phone_no, :sex, :date_of_birth, :address , :profile_image)
		end


end
