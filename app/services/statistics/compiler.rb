module Statistics

    # compile statistics for a given user
    class Compiler
        def initialize(user)
            @user = user
        end

        def compile
            Result.new(daily_plays, heart_stats)
        end

        private

        def daily_plays
            periods = [:week, :month, :year, :all_time]
            daily_plays = {}

            # songs played/day in past week/month/year
            periods.each do |period|
                daily_plays[period] = daily_plays_per_period period
            end

            daily_plays
        end

        def daily_plays_per_period(period = :week)
            timelapse = case period
                when :week then 7
                when :month then 30
                when :year then 365
                else nil end

            # if a timelapse (in days) is provided, count how many plays per day on average since timelapse began
            play_count = if timelapse then
                SongPlay.where(user: @user, played_at: timelapse.days.ago..Time.now).count / timelapse
            # otherwise, count average plays per day since user account was created
            else
                SongPlay.where(user: @user).count / user_timelapse
            end

            # round to 1 decimal
            play_count.round(1)
        end

        def heart_stats
            # distinct songs played at least once
            distinct_songs_played = SongPlay.where(user: @user).group(:song_id).count.size

            # distinct songs where the last play was made by heart
            songs_played = Song.joins(:song_plays).where(song_plays: { user: @user, by_heart: true })

            # running count
            distinct_songs_played_by_heart = 0

            songs_played.each do |song|
                # check if last song play was performed by heart; the OR clause allows for songs with played_at value of nil to be used, in case none of the SongPlays have a played_at value set
                if (song.last_play(@user) || SongPlay.where(user: @user, song: song).first).by_heart?
                    distinct_songs_played_by_heart += 1
                end
            end

            { total_played: distinct_songs_played, total_by_heart: distinct_songs_played_by_heart }
        end

        def user_timelapse
            (DateTime.now - @user.created_at.to_datetime).to_i
        end

        class Result
            def initialize(daily_plays, heart_stats)
                @daily_plays = daily_plays
                @heart_stats = heart_stats
            end

            def daily_plays_last_week
                @daily_plays[:week]
            end

            def daily_plays_last_month
                @daily_plays[:month]
            end

            def daily_plays_last_year
                @daily_plays[:year]
            end

            def daily_plays_all_time
                @daily_plays[:all_time]
            end

            def distinct_songs_played
                @heart_stats[:total_played]
            end

            def distinct_songs_by_heart
                @heart_stats[:total_by_heart]
            end

            def heart_ratio
                (distinct_songs_by_heart.to_f / distinct_songs_played.to_f * 100).round(1)
            end
        end
    end
end
