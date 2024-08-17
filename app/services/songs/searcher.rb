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
        def Result
            attr_reader :results_by_name, :results_by_artist, :results_by_lyrics
            def initialize(results_by_name = [], results_by_artist = [], results_by_lyrics = [])
                @results_by_name = results_by_name
                @results_by_artist = results_by_artist
                @results_by_lyrics = results_by_lyrics
            end

            def any?
                @results_by_name.any? || @results_by_artist.any? || @results_by_lyrics.any?
            end
        end
    end
end
