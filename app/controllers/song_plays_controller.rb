class SongPlaysController < ApplicationController
    def new
        set_song
        @song_play = SongPlay.new
    end

    def create
        set_song
        set_current_user
        @song_plays = Songs::Player.new(current_user).play({song_id: @song.id, by_heart: (params[:by_heart] || false)}).song_plays

        # user feedback that the practice was registered
        flash.now.notice = if params[:by_heart] then
                # count only the pracices by heart if the last practice was by heart
                t('flashes.song_played_by_heart', song: @song.name, heart_count: SongPlay.where(user: @user, song: @song, by_heart: true).count.ordinalize, play_count: SongPlay.where(user: @user, song: @song).count)
            else
                # count all practices if the last practice wasn't by heart
                t('flashes.song_played', song: @song.name, play_count: SongPlay.where(user: @user, song: @song).count.ordinalize)
            end

		# Because the response might update a song's information as displayed from within a list, the request should include the proper display options parameters which should then be communicated back to the response so it knows how to format the song's updated widget
		@short_row = params[:short_row] == "true"
		@hide_key = params[:hide_key] == "true"
    end

    private
    def set_song
        @song = Song.includes(:song_plays).find params[:song_id]
    end

    def song_play_params
        params.require(:song_play).permit(:song_id, :by_heart)
    end
end
