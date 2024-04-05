module SongsHelper
    def song_last_played_label(song, user = current_user)
        if user
            if song.last_play user
                # difference in days between now and the last time user played the song
                days_diff = (Time.now - song.last_played(user)) / (60*60*24)
                if (days_diff < 0)
                    days_label = "today"
                elsif (days_diff.floor == 1)
                    days_label = "yesterday"
                else
                    days_label = "#{days_diff.floor} days ago"
                end

                if song.last_play(user).by_heart
                    days_label << " (by heart)"
                end
                "Last played #{days_label}"
            else
                "Never played"
            end
        end
    end

    def song_row_color(song, user = current_user)

        last_play = song.last_play(current_user)
        if last_play&.by_heart
            "bg-accent"
        elsif last_play&.played_at
            if last_play.played_at > Time.now - 1.week
                  "song-row--green"
            end
        end
    end
end
