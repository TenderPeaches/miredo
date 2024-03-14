module Songs
    class Player
        def initialize(user)
            @user = user
        end

        # play a song `reps` times
        def play(song_play_params, reps = 1)
            song_plays = []

            # if no "played at" specified, default to right now
            song_play_params[:played_at] ||= Time.now
            song_play_params[:user_id] = @user.id

            # repeat the song being played
            reps.times do |rep|
                song_plays << SongPlay.create(song_play_params)
            end

            Result.new(song_plays)
        end

        class Result
            attr_reader :song_plays
            def initialize(song_plays)
                @song_plays = song_plays
            end

            def reps
                @song_plays.size
            end

            def rep
                @song_plays.first
            end


        end
    end
end
