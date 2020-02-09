class ApplicationController < ActionController::Base

	def list_books
		connection = SQLite3::Database.new 'db/development.sqlite3'
    	connection.results_as_hash = true

    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		connection = SQLite3::Database.new 'db/development.sqlite3'
    	connection.results_as_hash = true

    	book = connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", params[:id]).first
    	
    	render 'application/show_book', locals: { book: book }
	end


end
