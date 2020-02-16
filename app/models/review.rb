class Review
	attr_reader :id, :body, :author, :book_id, :created_at

	def initialize(attributes={})
		@id = attributes['id'] if new_record?
		@body = attributes['body']
		@author = attributes['author']
		@book_id = attributes['book_id']
		@created_at = attributes['created_at']
		
	end

#create a new id if the id does not exist in the db already
	def new_record?
		@id.nil?
	end
end