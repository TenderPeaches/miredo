class SetlistSongsController < ApplicationController
    def new
        @setlists = if user_signed_in? then Setlist.where(user: current_user) else [] end
        @song_id = params[:song_id]
        @setlist_song = SetlistSong.new(song_id: @song_id)
    end

    def create
        setlist_id = setlist_song_params[:setlist]
        song_id = setlist_song_params[:song]
        # if both setlist & song IDs are provided AND the specified setlist doesn't already include the given song (going with the assumption that a song cannot appear in a setlist more than once)
        if setlist_id && song_id && !Setlist.find(setlist_id).songs.include?(Song.find(song_id))
            SetlistSong.create(song_id:, setlist_id:)
        end

        @song = Song.find(song_id)
    end

    private

    def setlist_song_params
        params.require(:setlist_song).permit(:song, :setlist)
    end
end
