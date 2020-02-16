class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def list_books
		
    	books = Book.all

    	render 'application/list_books', locals: { books: books }
	end

	def show_book
		
    	book = Book.find(params['id'])
    	
    	render 'application/show_book', locals: { book: book }
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
    	book.save

    redirect_to '/list_books'
		
	end

	


end
