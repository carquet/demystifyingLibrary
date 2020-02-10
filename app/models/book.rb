class Book
  attr_reader :id, :title, :summary, :author, :in, :published

  def initialize(attributes={})
    @id = attributes['id']
    @title = attributes['title']
    @summary = attributes['summary']
    @author = attributes['author']
    @in = attributes['in']
    @published = attributes['published']
  end
end