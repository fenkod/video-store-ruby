class Movie
	attr_accessor :type, :title

	NEW_RELEASE = 0
	CHILDRENS = 1
	REGULAR = 2
	
	def initialize(type, title)
		self.type = type
		self.title = title
	end
end
