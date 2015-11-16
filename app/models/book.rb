class Book < ActiveRecord::Base
	
	validates :title, presence: true, length: {maximum: 500}, uniqueness: true
	validates :author, presence: true, length: {maximum: 200}
	validates :synopsis, presence: true, length: {maximum: 2000}, uniqueness: true
	before_save :title_titleize, :author_titleize
	has_many :tags, dependent: :destroy
	
	# capitalizes the title
	def title_titleize
		self.title = title.downcase.titleize
	end 
	
	# capitalizes the author
	def author_titleize
		self.author = author.titleize
	end

	

end
