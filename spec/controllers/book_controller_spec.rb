require 'rails_helper'

describe UserProfileController, type: :controller do

	before(:each) { sign_in create(:user) }

	describe 'GET #show' do


		it "assigns the requested user_profile to @user_profile" do
			user_profile = create(:user_profile)
			get :show, id: user_profile
			expect(assigns(:user_profile)).to eq user_profile
		end

		it "renders the :show template" do
			user_profile = create(:user_profile)
			get :show, id: user_profile
			expect(response).to render_template :show
		end

	end
end