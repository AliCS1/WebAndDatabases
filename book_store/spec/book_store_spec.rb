require 'book_repository'
require 'book'
require 'pg'

def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host:'127.0.0.1', dbname: 'book_store'})
    connection.exec(seed_sql)
end

describe BookRepository do
    before(:each) do
        reset_books_table
    end
    it 'returns the title of first book' do
        repo = BookRepository.new
        books = repo.all
        result = books[0].title
        expect(result).to eq 'Nineteen Eighty-Four'

    end
    it 'returns the length of books list' do
        repo = BookRepository.new
        books = repo.all
        result = books.length
        expect(result).to eq 5

    end
end
repo = BookRepository.new

books = repo.all

books[0].id # => 1
books[0].title # => Nineteen Eighty-Four
books[0].author_name # => George Orwell

books.length # => 5
