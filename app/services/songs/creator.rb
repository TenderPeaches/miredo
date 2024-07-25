module Songs
    class Creator
        def initialize(user_id)
            @submitter_id = user_id
        end

        def create(song_params)
            @song = Song.create(song_params.merge({submitter_id: @submitter_id}))

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
