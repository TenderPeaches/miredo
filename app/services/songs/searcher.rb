module Songs
    class Searcher
        def initialize(user)
            @user = user
        end

        def search(query = "")
            results_by_name = Song.includes(:song_contributions, :artists, :song_plays).search_by_song_name query
            results_by_artist = Song.includes(:song_contributions, :artists, :song_plays).search_by_artist_name query
            results_by_lyrics = Song.includes(:song_contributions, :artists, :song_plays).search_by_lyrics query

            Result.new(results_by_name, results_by_artist, results_by_lyrics)
        end

        private
        class Result
            attr_reader :by_name, :by_artist, :by_lyrics
            def initialize(by_name = [], by_artist = [], by_lyrics = [])
                @by_name = by_name
                @by_artist = by_artist
                @by_lyrics = by_lyrics
            end

            def any?
                @by_name.any? || @by_artist.any? || @by_lyrics.any?
            end
        end
    end
end
