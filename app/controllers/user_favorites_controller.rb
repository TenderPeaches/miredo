class UserFavoritesController < ApplicationController
    def new
        set_song

        if @song
            if params.has_key? :favorite

            end
        end
    end

    private
    def set_song
        @song = Song.find_by_id(params[:song_id])
    end

    def user_favorites_params

    end
end
