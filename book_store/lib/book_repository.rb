require_relative 'book'
require_relative 'database_connection'

class BookRepository
    def all
        book = []
        sql = 'SELECT * FROM books'
        result = DatabaseConnection.exec_params(sql, [])

        result.each { |record|
            b = Book.new
            b.id = record['id']
            b.title = record['title']
            b.author_name = record['author_name']

            book << b
        
        }

        return book

        #Returns a list of all the books
    end


end