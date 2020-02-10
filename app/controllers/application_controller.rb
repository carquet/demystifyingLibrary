class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def list_books
		
    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = book = find_book_by_id(params['id'])
    	
    	render 'application/show_book', locals: { book: book }
	end

	def new_book
		render 'application/new_book'	
	end

	def create_book
	    book = Book.new('title' => params['title'],
                    'summary' => params['summary'],
                    'author' => params['author'],
                    'isbn' => params['isbn'],
                    'in' => params['in'])
	    book.save
	    redirect_to '/list_books'
	end

	def edit_book
		book = find_book_by_id(params['id'])
		render 'application/edit_book' , locals: { book: book}
	end

	def delete_book
		connection.execute("DELETE FROM books WHERE books.id = ?", params['id'])
		redirect_to '/list_books'	
	end

	def find_book_by_id(id)
		connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", params[:id]).first
	end

	def update_book
		update_query = <<-SQL
      UPDATE books
      SET title      = ?,
          summary    = ?,
          author     = ?,
          isbn       = ?
      WHERE books.id = ?
    SQL
    connection.execute update_query, params['title'], params['summary'], params['author'], params['ISBN'], params['id']

    redirect_to '/list_books'
		
	end
def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  end
	


end
