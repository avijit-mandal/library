class BookController < ApplicationController
   before_filter :authenticate_user!

   def list
      @books = Book.all
   end

   def show
      @book = Book.find(params[:id])

   end

   def new
      @book = Book.new
      @subjects = Subject.all
   end

   def create
      
      @book = Book.new(book_params)
      @book.user_id = current_user.id

      if @book.save
            redirect_to :action => 'list'
      else
            @subjects = Subject.all
            render :action => 'new'
      end
   end

   def edit
      @book = Book.find(params[:id])
      @subjects = Subject.all
      if @book.user_id == current_user.id
         render :action => 'edit'
         
      else
         redirect_to :action => 'list'
      end
   end

   def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
         redirect_to :action => 'show', :id => @book
      else
         @subjects = Subject.all
         render :action => 'edit'
      end
   end

   def destroy
      @book = Book.find(params[:id])
      if @book.user_id == current_user.id
         @book.destroy
         redirect_to book_index_path
      else
         redirect_to :action => 'list'
      end
      
   end

   private
      def book_params
         params.require(:book).permit(:title, :price, :subject_id, :description)
      end
end