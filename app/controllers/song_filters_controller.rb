class SongFiltersController < ApplicationController
    def create

        @songs = if user_signed_in? then
            Song.filter(song_filter_params, Song.filter_by_visibility(current_user.id))
        else
            Song.filter(song_filter_params, Song.only_public)
        end
    end

    private
    def song_filter_params
        params.merge({user_id: current_user&.id })
    end
end
