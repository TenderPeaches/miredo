module Songs
    class Creator
        def initialize(user_id)
            @submitter_id = user_id
        end

        def create(song_params)

            @song = Song.new(song_params.merge({submitter_id: @submitter_id}))
            if @song.valid?
                @song.save
                # unless user specified a new artist
                unless song_params[:new_artist_name].present?
                    artist = Artist.find_by_id(song_params[:song_contributions_attributes]["0"][:artist_id])
                    if artist
                        # use the artist that was selected from the existing ones and link it to this song
                        SongContribution.create(song: @song, artist: artist)
                    end
                end
            end

            #! need to create song contribution if artists already exists
            Result.new(@song)
        end

        private
        class Result
            attr_reader :song
            def initialize(song)
                @song = song
            end

            def success?
                @song.valid?
            end

            def errors
                @song.errors
            end
        end
    end
end
