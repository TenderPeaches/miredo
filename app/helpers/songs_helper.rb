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
    def song_filter_from_id(song_filter_id, current_sort = :none, user_id: nil)
        case song_filter_id
        when :sort_by_capo.to_s.kebabcase
            song_filter_capo(current_sort)
        when :sort_by_most_played_by_user.to_s.kebabcase
            song_filter_most_played_by_user(user_id, current_sort)
        when :sort_by_last_played.to_s.kebabcase
            song_filter_last_played(user_id, current_sort)
        end
    end

    # a button that lets user filter songs by their suggested ca
    # @current_sort decides how the button looks, to indicate the user the current sort, default to :desc so that it initializes with no sort, as :desc sort leads to no sort (see rotate_filter_options)
    def song_filter_capo(current_sort = :none)
        sort_button "Capo", songs_path(sort_options: { capo: nil }), "sort-by-capo", current_sort
    end

    def song_filter_last_played(user_id, current_sort = :none)
        sort_button "Last Played", songs_path(sort_options: { "last_played(#{user_id})" => nil }), "sort-by-last-played", current_sort, inverted_sort: true
    end

    def song_filter_most_played_by_user(user_id, current_sort = :none)
        sort_button "Play Count", songs_path(sort_options: { "most_played_by_user(#{user_id})" => current_sort }), "sort-by-most-played-by-user", current_sort, inverted_sort: true
    end

    # the header row of a default song list
    def songs_list_header
        tag.div class: "song-list-header" do
            safe_join [
                tag.span(t('content.songs.favorite'), class: "songs-list__favorite"),
                tag.span(Song.model_name.human, class: "songs-list__title"),
                tag.span(Artist.model_name.human, class: "songs-list__artist"),
                tag.span(t('contents.songs.capo'), class: "songs-list__capo"),
                tag.span("Your play count", class: "songs-list__plays"),
                tag.span("Last played", class: "songs-list__last-played"),
                tag.span("Practice trackers", class: "songs-list__play"),
            ]
        end
    end

    # song capo selector
    def song_capo_tag(selected = 0, label = nil)
        # assume capo goes up to 10
        select_tag(label || :capo, options_for_select([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], selected: selected))
    end

    def song_capo_input(form, selected = 0, label = nil)
        form.select(label || :capo, options_for_select([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], selected: selected))
    end
end
