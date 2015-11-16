require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  def setup
  	@book = Book.new(title: "Example Book", author: "Foobar", synopsis: "A lovely example book.")
  end
  
  test "book is valid?" do 
  	assert @book.valid?
  end
  
  test "title should be present" do 
  	@book.title = "    "
  	assert_not @book.valid?
  end
  
  test "author should be present" do 
  	@book.author = "    "
  	assert_not @book.valid?
  end
  
  test "synopsis should be present" do 
  	@book.synopsis = "  "
  	assert_not @book.valid?
  end
  
  test "title should not be too long" do 
  	@book.title = "a" * 510
  	assert_not @book.valid?
  end
  
  test "author name should not be too long" do 
  	@book.author = "a" * 201
  	assert_not @book.valid?
  end
  
  test "synopsis should not be too long" do 
  	@book.synopsis = "a" * 2001
  	assert_not @book.valid?
  end
  
  test "title should be unique" do 
  	@other_book = Book.new
  	@other_book.title = "Example Book"
  	assert_not @other_book.valid?
  end
  
  test "synopsis should be unique" do
  	@other_book = Book.new
  	@other_book.synopsis = "A lovely example book."
  	assert_not @other_book.valid?
  end
  
end






