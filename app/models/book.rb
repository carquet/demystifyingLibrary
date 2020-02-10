class Book
  attr_reader :id, :title, :summary, :author, :isbn, :in, :published

  def initialize(attributes={})
    @id = attributes['id']
    @title = attributes['title']
    @summary = attributes['summary']
    @author = attributes['author']
    @isbn = attributes['isbn']
    @in = attributes['in']
    @published = attributes['published']
  end

  def save
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

  def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  end
end