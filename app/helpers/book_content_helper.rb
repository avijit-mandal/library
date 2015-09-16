module BookContentHelper
	def chapter_list
      @book_contents = BookContent.where(:book_id => params[:book_id])
   end
end
