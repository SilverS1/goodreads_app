class DeleteBookIdFromBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :book_id, :integer
  end
  
  def change
  	remove_column :reviews, :review, :text
  end
end
