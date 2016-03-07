class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
  
  def new
  	@review = Review.new
  end 
   
  
  def create
  	@review = Review.new(review_params)
  	@review.book_id = @book.id
  	if @review.save
  		flash[:success] = "Review created!"
  		redirect_to @book
  	else 
  		@review.save
  		flash[:info] = "Review not created"
  		redirect_to @book
  	end
  end 
  
  def index
  	@reviews = Review.all.paginate(:per_page => 12, :page => params[:page])
end


	def browse_reviews
		@reviews = Review.all.search_reviews(params[:search]).paginate(:per_page => 12, :page => params[:page])
		@books = Book.all
	end
  
  def edit
  	@review = Review.find(params[:id])
  end
  
  def update 
  	@review = Review.find(params[:id])
  	if @review.update(review_params)
  		flash[:success] = "review updated!"
  		redirect_to @book
  	else 
  		flash[:danger] = "A review field was not entered correctly."
  		render 'edit'
  	end
  end
  
  def destroy
  	@review = Review.find(params[:id]).destroy
  	flash[:info] = "Review deleted."
  	redirect_to @book
  end 
  
  def review_params
  	params.require(:review).permit(:content, :rating)
  end
  
  def find_book
  	@book = Book.find(params[:book_id])
  end
  
  def find_review 
  	@review = Review.find(params[:id])
  end
  
 
 
 
 
end
