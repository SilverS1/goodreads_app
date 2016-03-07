class AddBookIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_id, :integer, null: false
    add_index :books, :book_id
  end
end
