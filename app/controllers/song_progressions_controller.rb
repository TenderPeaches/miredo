class SongProgressionsController < ApplicationController
    before_action :set_song_progression, only: %i[ destroy ]
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
        
        @song_progression = SongProgression.new(song_progression_params)
        @song = Song.find_by_id(song_progression_params[:song_id])
        @song_progression_index = @song.song_progressions.count + 1

        respond_to do |format|
            if @song_progression.save 
                format.turbo_stream { render "songs/define_song_progressions/create_song_progression" }
            else
                flash.now[:alert] = t('errors.invalid_form', model: t('models.song_progression.model_name'), errors: @song_progression.errors.full_messages)
                format.turbo_stream { render plain: @song_progression.errors.full_messages }
            end
        end

    end

    def update 
    end

    def destroy
        @song_progression.destroy

        render 'songs/define_song_progressions/destroy_song_progression'
    end

    private 
    def set_song_progression
        @song_progression = SongProgression.find_by_id(params[:id])
    end 

    def song_progression_params 
        params.require(:song_progression).permit(:progression_id, :song_id, :uid, :tag, :lyrics, :reps, :key_id, :scale_id)
    end
end
