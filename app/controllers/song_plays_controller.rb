class SongPlaysController < ApplicationController
    def new
        set_song
        @song_play = SongPlay.new
    end

    def create
        set_song
        @song_play = Songs::Player.new(current_user).play({song_id: @song.id, by_heart: (params[:by_heart] || false)}).song_play
    end

    private
    def set_song
        @song = Song.find params[:song_id]
    end

    def song_play_params
        params.require(:song_play).permit(:song_id, :by_heart)
    end
end
