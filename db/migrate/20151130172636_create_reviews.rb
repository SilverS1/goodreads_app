class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :books
    add_index :reviews, [:book_id, :created_at]
  end
end
