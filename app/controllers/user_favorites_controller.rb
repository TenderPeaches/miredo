# users can flag songs as "favorites"
class UserFavoritesController < ApplicationController
    def new
        # need song_id param
        set_song

        # if song is found
        if @song
            # need toggled param
            if params.has_key? :toggled
                # if toggled=true
                if params[:toggled] == "true"
                    # unless there already exists a favorite association between the current user and @song
                    unless UserFavorite.where(user: current_user, song: @song).any?
                        # create the association
                        UserFavorite.create(user: current_user, song: @song)
                    end
                # otherwise, toggled is not true
                else
                    # delete any association between user and @song (should only be one, but this will clean up and extras if they somehow occur)
                    UserFavorite.where(user: current_user, song: @song).each do |favorite|
                        favorite.destroy
                    end
                end
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
