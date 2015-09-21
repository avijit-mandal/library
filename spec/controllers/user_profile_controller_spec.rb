require 'rails_helper'

RSpec.describe UserProfileController, type: :controller do
	let(:user) { create(:user) }
	let(:user_profile) { create(:user_profile, user: user) }

	before(:each) { sign_in user }

	describe "GET#show" do
		it "assigns usre profile details to @user_profile" do
			get :show, id: user_profile

			expect(assigns(:user_profile)).to eq user_profile
		end

		it "it renders to #show" do
			get :show, id: user_profile

			expect(response).to render_template :show
		end
	end

	describe "GET#new" do
		it "assigns a new user profile details to @user_profile" do
			get :new

			expect(assigns(:user_profile)).to be_a_new(UserProfile)
		end

		it "renders to #new" do
			
		end
	end
	describe "GET#edit" do
		it "asssigns user profile details to @user_profile"
		it "renders to #edit"
	end

	
end



	