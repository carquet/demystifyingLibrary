class Book
  attr_reader :id, :title, :summary, :author, :isbn, :in, :published

  def initialize(attributes={})
  	set_attributes(attributes)
  	
  end

  def set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @title = attributes['title']
    @summary = attributes['summary']
    @author = attributes['author']
    @isbn = attributes['isbn']
    @in = attributes['in']
    @published = attributes['published']
  end

  def new_record?
  	id.nil?
  end

#present? method, which is a method that Rails provides:
#"".present? => false
#nil.present? => false
#"somethign".present? => true
  def valid?
    title.present? && summary.present? && author.present?
    
  end

  def save
  	if new_record?
  		insert
  	else
  		update
  	end
  	
  end
  def insert
  	insert_query = <<-SQL
	      INSERT INTO books (title, summary, author, isbn, 'in', published)
	      VALUES (?, ?, ?, ?, ?, ?)
	    SQL

	    connection.execute insert_query,
	      title,
	      summary,
	      author,
	      isbn,
	      'available',
	      Date.current.to_s	
  end

  def update
  	update_query = <<-SQL
	      UPDATE books 
	      SET  	title   = ?,
	      		summary  = ?,
	      		author   = ?, 
	      		isbn   = ?,
	      		'in'   = ? , 
	      		published = ?
	      WHERE books.id = ?
	    SQL

	    connection.execute update_query,
	      title,
	      summary,
	      author,
	      isbn,
	      'available',
	      Date.current.to_s	
  end

  def destroy
  	connection.execute "DELETE FROM books WHERE books.id = ?", id
  end

  def self.all
  	book_hashes = connection.execute("SELECT * FROM books")
  	book_hashes.map do |book_hash|
  		Book.new(book_hash)
  	end
  	
  end

  def self.find(id)
  	book_hash = connection.execute("SELECT * FROM books WHERE books.id = ? LIMIT 1", id).first
  	Book.new(book_hash)
  	
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