class ProgressionsController < ApplicationController

    def index
        @song = Song.find_by_id(params[:song_id])
    end

    def new
        set_song
        set_progression_template

        # @song might be a new record
        if @song
            @progression = @song.progressions.build
        else
            @progression = Progression.new
        end

        # the progression_template can be specified before requesting the new song progression
        @progression.progression_template = @progression_template
    end

    def create
        set_song
        @progression = Progression.new(progression_params)
        @progression_index = @song.progressions.count + 1

        unless @progression.save
            alert_errors
        end

        if params[:create_another]
            @new_progression = @song ? @song.progressions.build : Progression.new
            @new_progression.progression_template = @progression.progression_template
            render :create_another
        else
            render :create
        end
    end

    def update
        set_progression

        unless @progression.update(progression_params)
            alert_errors
        end
    end

    def destroy
        set_progression
        @progression.destroy
    end

    private
    def set_progression
        @progression = Progression.find_by_id(params[:id])
    end

    def set_song
        @song = Song.find_by_id(params[:song_id])
    end

    def set_progression_template
        @progression_template = ProgressionTemplate.find_by_id(params[:progression_template_id])
    end

    def alert_errors
        flash.now[:alert] = t('errors.invalid.form', model: t('models.progression.model_name'), errors: @progression.errors.full_messages)
    end

    def progression_params
        params.require(:progression).permit(:progression_template_id, :song_id, :uid, :tag, :lyrics, :reps, :key_id, :scale_id, :sequence)
    end
end
