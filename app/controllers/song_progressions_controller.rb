class SongProgressionsController < ApplicationController

    def index
        @song = Song.find_by_id(params[:song_id])
    end

    def new
        set_song
        set_progression_template

        # @song might be a new record
        if @song
            @song_progression = @song.song_progressions.build
        else
            @song_progression = SongProgression.new
        end

        # the progression_template can be specified before requesting the new song progression
        @song_progression.progression_template = @progression_template
    end

    def create
        set_song
        @song_progression = SongProgression.new(song_progression_params)
        @song_progression_index = @song.song_progressions.count + 1

        unless @song_progression.save
            alert_errors
        end
    end

    def update
        set_song_progression

        unless @song_progression.update(song_progression_params)
            alert_errors
        end
    end

    def destroy
        set_song_progression
        @song_progression.destroy
    end

    private
    def set_song_progression
        @song_progression = SongProgression.find_by_id(params[:id])
    end

    def set_song
        @song = Song.find_by_id(params[:song_id])
    end

    def set_progression_template
        @progression_template = ProgressionTemplate.find_by_id(params[:progression_template_id])
    end

    def alert_errors
        flash.now[:alert] = t('errors.invalid.form', model: t('models.song_progression.model_name'), errors: @song_progression.errors.full_messages)
    end

    def song_progression_params
        params.require(:song_progression).permit(:progression_template_id, :song_id, :uid, :tag, :lyrics, :reps, :key_id, :scale_id)
    end
end
