class BookController < ApplicationController
  before_action :authenticate_user!, except: [:list, :show]

  def list
    @books = Book.all

    redis = Redis::Namespace.new("medicine", :redis => Redis.new)
    @links = redis.scard('med_links')
    @c_link = redis.get('current_link')
  end

  def my_books
    @books = Book.all.where(user_id: current_user.id)

    CollectAllLinksJob.perform_now
  end

  def show
    @book = Book.find(params[:id])
    @subject = Subject.find(@book.subject_id)
  end

  def new
    @book = Book.new
    @subjects = Subject.all

    CollectAllLinksJob.perform_now
  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
       upload_cover_image(@book.id)
       redirect_to root_path
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
       upload_cover_image(@book.id)
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
       params.require(:book).permit(:title, :author, :price, :subject_id, :description, image_attributes: [:name])
    end

    def upload_cover_image(book)
       @book = Book.find(book)
       if @book.image.present?
          @book.image.update_attributes(name: params[:book][:name])
       else
          image = Image.new
          image.name = params[:book][:name]
          image.imageable = @book
          image.save
       end
    end
end