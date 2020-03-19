class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def list_books
		
    	books = Book.all

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = Book.find(params['id'])
    	reviews = connection.execute('SELECT * FROM reviews WHERE reviews.book_id = ? ', params['id'])
    	render 'application/show_book', locals: { book: book, reviews: reviews }
	end

	def new_book
		book = Book.new
		render 'application/new_book'	, locals: {book: book}
	end

	def create_book
	    book = Book.new('title' => params['title'],
                    'summary' => params['summary'],
                    'author' => params['author'],
                    'isbn' => params['isbn'],
                    'in' => params['in'])
	    if book.save
	    	redirect_to '/list_books'
	    else
	    	render 'application/new_book', locals: {book: book}
	    end
	end

	def create_review
			book = Book.find(params['book_id'])
			book.create_reviews('body' => params['body'],
													'author' => params['author']
				)

	      redirect_to "/show_book/#{params['book_id']}"
		
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


	def update_book
		book = Book.find(params['id'])
		book.set_attributes('title' => params['title'], 'summary' => params['summary'], 'author' => params['author'], 'isbn' => params['isbn'], 'in' => params['in'])
    if book.save
    	redirect_to '/list_books'
    else
    	render 'application/edit_book', locals: {book: book}
    end
		
	end

	def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  end




end
