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

	def save
		if new_record?
			insert
		else
			return false
		end
	end

	def insert
		insert_review_query = <<-SQL
	      INSERT INTO reviews (body, author, book_id, created_at)
	      VALUES (?, ?, ?, ?)
	    SQL

	    connection.execute insert_review_query,
		    body,
		    author,
		    book_id,
	      Date.current.to_s	
		
	end

	def self.connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  end

  def connection
  	self.class.connection
  end
end