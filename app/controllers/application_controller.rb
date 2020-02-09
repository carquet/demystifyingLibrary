class ApplicationController < ActionController::Base

	def list_books
		
    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", params[:id]).first
    	
    	render 'application/show_book', locals: { book: book }
	end

	def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  	end


end
