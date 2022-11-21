require 'album'
require 'album_repository'
require 'pg'

def reset_albums_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test'})
    connection.exec(seed_sql)
end
describe AlbumRepository do 
    before (:each) do
        reset_albums_table
    end
    it 'returns data for first entry' do
        repo = AlbumRepository.new
        albums = repo.all
        result = albums[0].id
        expect(result).to eq "1"
    end
    it 'returns length of albums' do
        repo = AlbumRepository.new
        albums = repo.all
        result = albums.length
        expect(result).to eq 12
    end

    it 'returns title of second record' do
        repo = AlbumRepository.new
        album = repo.find(2)
        result = album.title
        expect(result).to eq 'Surfer Rosa'

    end

end
#1 
# Get all students
#repo = AlbumRepository.new

#albums = repo.all

#albums.length # => 12

#albums[0].id # => 1
#albums[0].title # => 'Doolittle'
#albums[0].release_year # => 1989
#albums[0].artist_id # => 1

#albums[1].id # => 2
#albums[1].release_year # => Surfer Rosa

#2
# Find specific album

#repo = AlbumRepository.new

#album = repo.find(3)

#album.id # => 4
#album.title # => Super Trouper
#album.release_year # => 1980
#album.artist_id # => 2

#3
# Create new album

#repo = AlbumRepository.new
#new_album = album.new
#new_album.title = 'New World'
#new_album.release_year = 2002
#new_album.artist_id = 3
#repo.create(new_album)

#albums = repo.all
#albums[-1].title # => 'New World'
#albums[-1].release_year # 2002

