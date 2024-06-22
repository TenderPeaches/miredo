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
            "song-row--by-heart"
        elsif last_play&.played_at
            if last_play.played_at > Time.now - 10.days
                "song-row--green"
            elsif last_play.played_at > Time.now - 20.days
                "song-row--yellow"
            elsif last_play.played_at > Time.now - 30.days
                "song-row--orange"
            elsif last_play.played_at > Time.now - 50.days
                "song-row--red"
            end
        end
    end

    # returns the correct filter from a given song_filter_id (HTML id)
    def song_filter_from_id(song_filter_id, previous_sort = :none, user_id: nil)
        case song_filter_id
        when :sort_by_capo.to_s.kebabcase
            song_filter_capo(previous_sort)
        when :sort_by_most_played_by_user.to_s.kebabcase
            song_filter_most_played_by_user(user_id, previous_sort)
        when :sort_by_last_played.to_s.kebabcase
            song_filter_last_played(user_id, previous_sort)
        end
    end

    def song_filter_capo(previous_sort = :none)
        sort_order = rotate_filter_order(false, previous_sort)
        turbo_link_button "Capo#{sort_order_label(sort_order)}", songs_path(sort_options: { capo: sort_order }), id: "sort-by-capo"
    end

    def song_filter_last_played(user_id, previous_sort = :none)
        sort_order = rotate_filter_order(true, previous_sort)
        turbo_link_button "Last Played#{sort_order_label(previous_sort)}", songs_path(sort_options: { "last_played(#{user_id})" => sort_order }), id: "sort-by-last-played"
    end

    def song_filter_most_played_by_user(user_id, previous_sort = :none)
        sort_order = rotate_filter_order(true, previous_sort)
        turbo_link_button "Most Played#{sort_order_label(previous_sort)}", songs_path(sort_options: { "most_played_by_user(#{user_id})" => sort_order }), id: "sort-by-most-played-by-user"
    end
end
