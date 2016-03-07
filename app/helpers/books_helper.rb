module BooksHelper

	def create_id(book)
		session[:book_id] = book.id
	end

end
