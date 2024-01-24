class SongProgressionsController < ApplicationController
    def new 
        @song = Song.find_by_id(params[:song_id])
        @progression = Progression.find_by_id(params[:progression_id])
        
        if @song
            @song_progression = @song.song_progressions.build
        else
            @song_progression = SongProgression.new
        end

        @song_progression.progression = @progression

        respond_to do |format|
            format.turbo_stream { render "songs/define_song_progressions/add_song_progression" }
        end
    end 

    def create
        
    end

    def update 
    end
end
