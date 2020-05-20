class UserProfileController < ApplicationController

  def edit
    @profile = User.find(params[:id])
  end

  def show
    @profile = User.find(params[:id])
  end
end
