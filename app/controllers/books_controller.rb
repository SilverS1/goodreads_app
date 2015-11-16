class BooksController < ApplicationController

  def index
  	@books = Book.all
  end 
  
  def show
  	@books = Book.all
  end 
  
  def new
  	@book = Book.new
  end
  
  def create
  	@book = Book.new(book_params) 
  	if @book.save
  		flash[:info] = "Book successfully saved!"
  		redirect_to root_url
  	else
  		render 'new' 
  	end 
  end 
  
  def update
  end
  
  def delete
  	@book = Book.find(params[:id]).destroy
  end
  
  def book_params 
  	params.require(:book).permit(:title, :author, :synopsis)
  end 
  
 
  
end
