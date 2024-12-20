class SetlistSongsController < ApplicationController
    def new
        @setlists = if user_signed_in? then Setlist.where(user: current_user) else [] end
        @song_id = params[:song_id]
        @setlist_song = SetlistSong.new(song_id: @song_id)
    end

    def create
        setlist = Setlist.find_by_id(setlist_song_params[:setlist])
        song = Song.find_by_id(setlist_song_params[:song])
        # if both setlist & song IDs are provided AND the specified setlist doesn't already include the given song (going with the assumption that a song cannot appear in a setlist more than once)
        if setlist && song && !setlist.songs.include?(song)
            SetlistSong.create(song:, setlist:, sequence: (setlist.setlist_songs.maximum(:sequence) || 0) + 1)
        end

        @song = song
    end

    private

    def setlist_song_params
        params.require(:setlist_song).permit(:song, :setlist)
    end
end
