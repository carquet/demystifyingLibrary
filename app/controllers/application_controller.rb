class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def list_books
		
    	books = connection.execute("SELECT * FROM books")

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = Book.find(params['id'])
    	
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
		book = Book.find(params['id'])
		render 'application/edit_book' , locals: { book: book}
	end

	def delete_book
		book = Book.find(params['id'])
		book.destroy
		redirect_to '/list_books'	
	end

	def find_book_by_id(id)
		connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", params[:id]).first
	end

	def update_book
		book = Book.find(params['id'])
		book.set_attributes('title' => params['title'], 'summary' => params['summary'], 'author' => params['author'], 'isbn' => params['isbn'], 'in' => params['in'])
    	book.save

    redirect_to '/list_books'
		
	end

	


end
