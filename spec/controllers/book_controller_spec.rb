require 'rails_helper'

describe BookController, type: :controller do

	before(:each) { sign_in create(:user) }

	describe 'GET #show', :broken do
		it "assigns the requested book to @book" do
			book = create(:book)
			subject = create(:subject)
			
			get :show, subject_id: book.subject_id
			
			expect(assigns(:book)).to eq book
		end

		it "renders the :show template" do
			book = create(:book)

			get :show, id: book

			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		it "assigns a new Book to @book" do
			get :new
			
			expect(assigns(:book)).to be_a_new(Book)
		end

		it "renders the :new template" do
			get :new
			
			expect(response).to render_template :new
		end
	end

	describe 'GET #list' do

		it "assigne all the books to @books" do
			book = create(:book)

			get :list

     		expect(assigns(:books)).to eq [book]
		end
		it "renders the :list template" do
			get :list

			expect(response).to render_template :list
		end

	
	end
end