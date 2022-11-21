require_relative 'lib/database_connection'
require 'pg'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

repo = BookRepository.new

books = repo.all

books.each {|book|
    p book.id + " - " + book.title + " - " + book.author_name


}