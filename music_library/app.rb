require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require 'pg'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
repo = AlbumRepository.new
result = repo.find(3)
p result
