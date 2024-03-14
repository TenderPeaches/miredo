class SongPlaysController < ApplicationController
    def create
        set_song
        @song_play = Songs::Player.new(current_user).play(@song).song_play
    end

    private
    def set_song
        @song = Song.find params(:song_id)
    end

    def song_play_params
        params.require(:song_play).permit()
    end
end
