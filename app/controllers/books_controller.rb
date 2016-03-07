class BooksController < ApplicationController


  def index
  	@books = Book.all.order('created_at DESC').paginate(:per_page => 12, :page => params[:page])
  end 
  
  def browse_index
  	@books = Book.all.search_index(params[:search]).paginate(:per_page => 12, :page => params[:page])
  end
  
  def books_index
  	if params[:tag].present?
  		@books = Book.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 12)
  	else
  		@books = Book.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  	end
  end
  
	def browse_genre
		@books = Book.all.search_genre(params[:search]).order('created_at DESC').paginate(:per_page => 12, :page => params[:page])
	end
	
	
	def browse_ratings
		@books = Book.all.joins(:reviews).search_ratings(params[:search]).order('created_at DESC').paginate(:per_page => 12, :page => params[:page])
	end
	
	def browse_tags 
		@books = Book.all.joins(:tags).search_tags(params[:search]).order('created_at DESC').paginate(:per_page => 12, :page => params[:page])
	end


  
  def show
  	@book = Book.find(params[:id])
  	@reviews = @book.reviews.paginate(page: params[:page])
  end 
  
  def new
  	@book = Book.new
  end
  
  def create
  	@book = Book.new(book_params) 
  	# @book.book_id = session[:id]
  	if @book.save
  		flash[:success] = "Book created!"
  		redirect_to index_url
  	else
  		flash[:danger] = "A book field was not entered correctly."
  		render 'new' 
  	end 
  end 
  
  def update
  	@book = Book.find(params[:id]) # also, don't used find_by on update, will not save correctly. 
  	if @book.update_attributes(book_params)
  		flash[:success] = "Book updated!"
  		redirect_to @book
  	else
  		flash[:danger] = "A book field was not entered correctly."
  		render 'edit'
  	end
  end
  
  def edit
  	@book = Book.find(params[:id]) # don't use find_by on an edit action, will render the wrong information.
  end
  
  def destroy
  	@book = Book.find(params[:id]).destroy
  	flash[:info] = "Book deleted." 
  	redirect_to index_url
  end
  
  def book_params 
  	params.require(:book).permit(:title, :author, :genre, :synopsis, :cover, :tag_list)
  end 
  
  def find_book
  	@book = Book.find_by(params[:id])
  end
  
  def current_book
  	@current_book ||= Book.find_by(id: session[:book_id])
  end
  
  def create_id(book)
	@book = Book.find(params[:id])
	@book.id = :book_id
  end
  
  
  
  
  


  
 
  
end
