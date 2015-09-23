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
		it "assigns user profile details to @user_profile" do
			get :edit, id: user_profile

			expect(assigns(:user_profile)).to eq user_profile
		end

		it "renders to #edit" do
			get :edit, id: user_profile

			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do

		context "with valid attributes" do
			it "saves the new user_profile in the database" do
				expect{
				 post :create, user_profile: attributes_for(:user_profile)
				}.to change(UserProfile, :count).by(1)
			end

			it "redirects to #show" do
				post :create, user_profile: attributes_for(:user_profile)
				
				expect(response).to redirect_to user_profile_path(assigns[:user_profile])
			end
		end

		context "with invalid attributes" do
			it "does not save the new book in the database" do
				expect{
				 post :create, user_profile: attributes_for(:user_profile, phone_no: nil)
				}.to_not change(UserProfile, :count)
			end

			it "re-renders the :new template" do
				post :create, user_profile: attributes_for(:user_profile, phone_no: nil)

				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH #update', focus: true do
		
		context "valid attributes" do
			it "located the requested @user_profile" do
				patch :update, id: user_profile, user_profile: attributes_for(:user_profile)
				
				expect(assigns(:user_profile)).to eq(user_profile)
			
			end

			it "changes @user_profile's attributes" do
				patch :update, id: user_profile,
				user_profile: attributes_for(:user_profile,
				phone_no: 8792208196)
				
				user_profile.reload
				
				expect(user_profile.phone_no).to eq(8792208196)
			end
			
			it "redirects to the updated contact" do
				patch :update, id: user_profile, user_profile: attributes_for(:user_profile)
	
				expect(response).to redirect_to user_profile_path(assigns[:user_profile])
			
			end
		end

		context "with invalid attributes" do
			it "does not change the user_profile's attributes" do
				
				patch :update, id: user_profile,
				 user_profile: attributes_for(:user_profile,
				 phone_no: "8792208196", date_of_birth: nil)
				
				user_profile.reload
				
				expect(user_profile.phone_no).to_not eq(8792208196)
				expect(user_profile.phone_no).to eq(1234567890)
			end

			it "re-renders the edit template" do
				patch :update, id: user_profile,
				 user_profile: attributes_for(:user_profile, phone_no: nil)
				
				expect(response).to render_template :edit
			end
		end
	end
end



	