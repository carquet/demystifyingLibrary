class ApplicationController < ActionController::Base

	def list_books
		connection = SQLite3::Database.new 'db/development.sqlite3'
    	connection.results_as_hash = true

    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

end
