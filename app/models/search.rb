class Search < ActiveRecord::Base

	def self.search(search)
  		if search
   		 where('title LIKE ? or author LIKE ?', "%#{search}%", "%#{search}%")
  		else
   		 all
  		end
	end

end
