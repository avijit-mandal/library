class BookContentController < ApplicationController
   before_filter :find_book

 #   def chapter_list
 #      @book_contents = BookContent.where(:book_id => params[:book_id])
 #   end

   def show
      @book_content = BookContent.find(params[:id])
      # @book_contents = BookContent.where(:book_id => params[:book_id])
   end

   def new
      @book_content = BookContent.new
      @subjects = Subject.all
   end

   def create
      @book_content = BookContent.new(book_content_params.merge({ :book_id => @book.id}))

      @book_content.user_id = current_user.id
      if @book_content.save
            redirect_to :action => 'show', :id => @book_content
      else
            @subjects = Subject.all
            render :action => 'new'
      end
   end

   def edit
      @book_content = BookContent.find(params[:id])

      if @book_content.user_id == current_user.id
         render :action => 'edit'
         
      else
         redirect_to :action => 'show'
      end
   end

   def update
      @book_content = BookContent.find(params[:id])
      if @book_content.update_attributes(book_content_params)
         redirect_to :action => 'show'
      else
         @subjects = Subject.all
         render :action => 'edit'
      end
   end

   def destroy
      @book_content = BookContent.find(params[:id])
      if @book_content.user_id == current_user.id
         @book_content.destroy
         
         redirect_to :action => 'show'
      else
         redirect_to :action => 'show'
      end
      
   end

   private
      def book_content_params
         params.require(:book_content).permit( :user_id, :book_id, :chapter, :chapter_content)
      end

   def find_book
     @book = Book.find(params[:book_id])
   end
end
