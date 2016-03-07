class Book < ActiveRecord::Base
	has_many :reviews
	has_many :ratings
	mount_uploader :cover, CoverUploader
	#attr_accessor :genre
	validates :title, presence: true, length: {maximum: 500}, uniqueness: true
	validates :author, presence: true, length: {maximum: 200}
	validates :synopsis, presence: true, length: {maximum: 2000}, uniqueness: true
	validates :genre, presence: true, length: {maximum: 100}
	before_save :title_titleize, :author_titleize, :genre_titleize, :synopsis_capitalize
	acts_as_taggable
	# has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	#attr_accessor :image
	#mount_uploader :image, ImageUploader
	
	# capitalizes the title
	def title_titleize
		self.title = title.downcase.titleize
	end 
	
	# capitalizes the author
	def author_titleize
		self.author = author.titleize
	end
	
	def genre_titleize
		self.genre = genre.downcase.titleize
	end
	
	def synopsis_capitalize
		self.synopsis = synopsis.capitalize
		self.synopsis = synopsis.gsub(/[a-z][^.?!]*/) { |match| match[0].upcase + match[1..-1].rstrip }
	end
	
	def feed
		Review.where("book_id = ?", id)
	end
	
	def self.search_index(search)
  		if search
   		 where('title LIKE ? or author LIKE ?', "%#{search}%", "%#{search}%")
  		else
   		 all
  		end
	end
	
	def self.search_genre(search)
	if search
   		 where('genre LIKE ?', "%#{search}%")
  		else
   		 all
  		end
	end
	
	def self.search_tags(search)
	if search
   		 where('name LIKE ?', "%#{search}%")
  		else
   		 all
  		end
	end
	
	def self.search_ratings(search)
		if search
			where('rating LIKE ?', "%#{search}%")
		else 
			all
		end	
	end
	




	

end
