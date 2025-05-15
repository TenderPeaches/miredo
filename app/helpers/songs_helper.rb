module SongsHelper
    def song_last_played_label(song, user = current_user)
        if user
            if song.last_play user
                # difference in days between now and the last time user played the song
                days_diff = (Time.now - song.last_played(user)) / (60*60*24)
                if (days_diff < 0)
                    days_label = t("content.today")
                elsif (days_diff.floor == 1)
                    days_label = t("content.yesterday")
                else
                    days_label = "#{days_diff.floor} #{t("content.songs.days_ago")}"
                end

                if song.last_play(user).by_heart
                    days_label << " (#{t("content.songs.by_heart")})"
                end
                days_label
            else
                t("content.songs.never")
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

    # a button that lets user filter songs by their suggested capo
    # @current_sort decides how the button looks, to indicate the user the current sort, default to :desc so that it initializes with no sort, as :desc sort leads to no sort (see rotate_filter_options)
    def song_filter_capo(current_sort = :none)
        sort_button I18n.t("content.songs.filter_capo"), songs_path(sort_options: { capo: nil }), "sort-by-capo", current_sort
    end

    def song_filter_last_played(user_id, current_sort = :none)
        sort_button I18n.t("content.songs.filter_last_played"), songs_path(sort_options: { "last_played(#{user_id})" => nil }), "sort-by-last-played", current_sort, inverted_sort: true
    end

    def song_filter_most_played_by_user(user_id, current_sort = :none)
        sort_button I18n.t("content.songs.filter_most_played"), songs_path(sort_options: { "most_played_by_user(#{user_id})" => nil }), "sort-by-most-played-by-user", current_sort, inverted_sort: true
    end

    def song_filter_created_at(current_sort = :none)
        sort_button I18n.t("content.songs.filter_created_at"), songs_path(sort_options: { "created_at" => nil }), "sort-by-created-at", current_sort, inverted_sort: true
    end

    # the header row of a default song list
    def songs_list_header
        tag.div class: "song-list-header" do
            safe_join [
                tag.span(t('content.songs.favorite'), class: "song-list__favorite"),
                tag.span(Song.model_name.human, class: "song-list__title"),
                tag.span(Artist.model_name.human, class: "song-list__artist", title: Song.human_attribute_name(:artist)),
                tag.span(t('content.songs.capo'), class: "song-list__capo", title: Song.human_attribute_name(:capo)),
                tag.span(Song.human_attribute_name(:nb_practices), class: "song-list__plays", title: t('hints.user_song_plays')),
                tag.span(Song.human_attribute_name(:last_practice), class: "song-list__last-played", title: t('hints.user_last_practice')),
                tag.span(nil, class: "song-list__play")
            ]
        end
    end

    # This is displayed as part of a "Capo: [info]" binome, where this function provides the "info" part
    def song_capo_label(song)
        if song.capo.nil? || song.capo == 0 then
            t('content.keywords.none')
        elsif song.capo < 0 then
            t('content.songs.negative_capo', capo: (song.capo * -1).to_s)
        else
            song.capo.to_s
        end
    end

    # This is displayed as a standalone label, like "No capo", "Capo 3", etc.
    def song_capo_hint(song)
        if song.capo.nil? || song.capo == 0 then
            t("content.songs.no_capo")
        elsif song.capo < 0 then
            t("content.songs.negative_capo", capo: (song.capo * -1).to_s)
        else
            "#{t("content.songs.capo")} #{song.capo}"
        end
    end

    # song capo selector
    def song_capo_tag(selected = 0, label = nil)
        # assume capo goes up to 10
        select_tag(label || :capo, options_for_select([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], selected: selected), class: "select-capo")
    end

    def song_capo_input(form, selected = 0, label = nil)
        form.select(label || :capo, options_for_select([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], selected: selected))
    end

    def song_play_button(song_id, qsa = {})
        turbo_link_button t('controls.play'), song_plays_path({ song_id: song_id }.merge(qsa)), method: :post, class: "button--square", title: t('instructions.song_play')
    end

    def song_play_by_heart_button(song_id, qsa = {})
        turbo_link_button t('controls.play_by_heart'), song_plays_path({ song_id: song_id, by_heart: true }.merge(qsa)), method: :post, class: "button--square", title: t('instructions.song_play_by_heart')
    end

    def song_edit_button(song_id)
        link_button_to t('controls.edit'), edit_song_path(song_id), class: "button--square button--secondary", title: t('instructions.edit_song')
    end

    def song_add_to_setlist_button(song_id)
        turbo_link_button t("controls.add"), new_setlist_song_path(song_id:), class: "button--square", title: t("instructions.add_to_setlist")
    end

    def song_edit_progression_templates_link(song_id)
        link_to t('cta.define_progression_templates'), song_progression_templates_path(song_id: song_id), title: t('instructions.define_progressions')
    end

    def song_edit_progressions_link(song_id)
        link_to t('cta.edit_song_structure'), song_progressions_path(song_id: song_id), title: t('instructions.edit_song_structure')
    end

    def song_color_legend_sample(name, text)
        tag.div class: "legend__item" do
            safe_join [
                tag.div(class: "legend__sample legend__sample--#{name.kebabcase}"),
                tag.div(text, class: "description")
            ]
        end
    end
end
