class UserProfileController < ApplicationController
	before_filter :authenticate_user!
	

	def new
		@user_profile = UserProfile.new
	end

	def create
		
		@user_profile = UserProfile.new(user_params)
		@user_profile.user_id = current_user.id

		if @user_profile.save
			upload_profile_image

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
    	@user_profile = current_user.user_profile

    	if @user_profile.update_attributes(user_params)
    		upload_profile_image
        redirect_to user_profile_path(@user_profile)
    	else
        render :action => 'edit'
      end
	end

	private

		def user_params
			params.require(:user_profile).permit(:user_id, :phone_no, :sex, :date_of_birth, :address, image_attributes: [:name])
		end

		def upload_profile_image
			if current_user.image.present?
				current_user.image.update_attributes(name: params[:user_profile][:name])
			else
				image = Image.new
	    	image.name = params[:user_profile][:name]
	    	image.imageable = current_user
				image.save
			end
		end


end
