require_relative 'Album'
class AlbumRepository

    def all
        albums = []
        sql = 'SELECT * FROM ALBUMS'
        result = DatabaseConnection.exec_params(sql, [])
        result.each { |record| 
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']
            albums << album
        }
        #returns array of albums objects
        return albums

    end

    def find(id)
        sql = 'SELECT * FROM ALBUMS WHERE id = $1'
        params = [id]

        result = DatabaseConnection.exec_params(sql,params)

        album = Album.new
        album.id = result[0]['id']
        album.title = result[0]['title']
        album.release_year = result[0]['release_year']
        album.artist_id = result[0]['artist_id']
        
        return album

    end
end