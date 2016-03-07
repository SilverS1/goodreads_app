class Review < ActiveRecord::Base
	belongs_to :book
	validates :content, presence: true
	validates :rating, presence: true
	has_many :ratings
	before_save :content_capitalize
	
	def content_capitalize
		self.content = content.capitalize
		self.content = content.gsub(/[a-z][^.?!]*/) { |match| match[0].upcase + match[1..-1].rstrip }
	end
	
	
	
	def self.search_reviews(search)
	if search
   		 where('content LIKE ?', "%#{search}%")
  		else
   		 all
  		end
	end
	
end
