class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def list_books
		
    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", params[:id]).first
    	
    	render 'application/show_book', locals: { book: book }
	end

	def new_book
		render 'application/new_book'	
	end

	def create_book
	    insert_query = <<-SQL
	      INSERT INTO books (title, summary, author, ISBN, 'in', published)
	      VALUES (?, ?, ?, ?, ?, ?)
	    SQL

	    connection.execute insert_query,
	      params['title'],
	      params['summary'],
	      params['author'],
	      params['ISBN'],
	      params['in'],
	      Date.current.to_s

	    redirect_to '/list_books'
	end

	def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  	end


end
