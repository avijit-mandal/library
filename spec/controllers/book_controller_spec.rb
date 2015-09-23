require 'rails_helper'

RSpec.describe BookController, type: :controller do

	let(:user) { create(:user) }
	let(:subject) {create(:subject)}
	let(:book) { create(:book, user: user, subject: subject) }

	before(:each) { sign_in user }

	describe 'GET #list' do

		it "assigne all the books to @books" do
			# book = create(:book, user: user)

			get :list

     		expect(assigns(:books)).to eq [book]
		end
		it "renders the :list template" do
			get :list

			expect(response).to render_template :list
		end
	end

	describe 'GET #show' do
		it "assigns the requested book to @book" do
			# subject = create(:subject, id: '6')
			# book = create(:book)
			
			get :show, id: book
			
			expect(assigns(:book)).to eq book
		end

		it "renders the :show template" do
			# book = create(:book)
			# subject = create(:subject, id: '6')

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

	describe 'GET #edit' do
		it "assigns book to @book" do
			# book = create(:book)

			get :edit, id: book

			expect(assigns(:book)).to eq book
		end

		it "renders the :edit template" do
			# book = create(:book)

			get :edit, id: book

			expect(response).to render_template :edit
		end

	end

	describe "POST #create" do

		context "with valid attributes" do
			it "saves the new user in the database" do
				
				expect{
				 post :create, book: attributes_for(:book)
				}.to change(Book, :count).by(1)
			end

			it "redirects to #list" do
				post :create, book: attributes_for(:book)
				expect(response).to redirect_to root_path
			end
		end

		context "with invalid attributes" do
			it "does not save the new book in the database" do
				expect{
				 post :create, book: attributes_for(:book, title: nil)
				}.to_not change(Book, :count)
			end

			it "re-renders the :new template" do
				post :create, book: attributes_for(:book, title: nil)

				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH #update' do
		

		context "valid attributes" do
			it "located the requested @book" do
				patch :update, id: book, book: attributes_for(:book)
				
				expect(assigns(:book)).to eq(book)
			
			end

			it "changes @book's attributes" do
				patch :update, id: book,
				book: attributes_for(:book,
				title: "advance ruby", description: "advance programme of ruby")
				
				book.reload
				
				expect(book.title).to eq("advance ruby")
				expect(book.description).to eq("advance programme of ruby")
			
			end
			
			it "redirects to the updated contact" do
				patch :update, id: book, book: attributes_for(:book)
	
				expect(response).to redirect_to book_path
			
			end
		end

		context "with invalid attributes" do
			it "does not change the contact's attributes" do
				
				patch :update, id: book,
				 book: attributes_for(:book,
				 title: "advance ruby", description: nil)
				
				book.reload
				
				expect(book.title).to_not eq("advance ruby")
				expect(book.title).to eq("ruby on rails")
				expect(book.description).to eq("book on ruby on rails")
			end

			it "re-renders the edit template" do
				patch :update, id: book,
				 book: attributes_for(:book, description: nil)
				
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE destroy' do
		context 'Authorized access' do
			before :each do
				@book = book
			end

			it "deletes the contact" do
				expect{
				 delete :destroy, id: @book
				 }.to change(Book, :count).by(-1)
			end
			
			it "redirects to books#list" do

				delete :destroy, id: @book
				
				expect(response).to redirect_to book_index_path
			end
		end

		context 'Unauthorized access' do
			it "redirects to book" do
				readonly_book = create(:book)

				delete :destroy, id: readonly_book

				expect(response).to redirect_to book_index_path
			end
		end
	end
end