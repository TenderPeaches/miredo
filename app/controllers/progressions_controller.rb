class ProgressionsController < ApplicationController

    def index
        @song = Song.find_by_id(params[:song_id])
    end

    def new
        # if copying form an existing progression, the request will have a progression_id of the progression to be copied
        if params[:progression_id]
            original = Progression.find(params[:progression_id])
            @progression = original.dup

            # reset the sequence to nil, because it doesn't make sense to have two progressions with the same sequence number
            @progression.sequence = nil
            @song = @progression.song
        else
            set_song
            set_progression_template
            @progression = Progressions::Creator.new(@song, current_user).build(Progression.new(progression_template: @progression_template)).progression
        end
    end

    def create
        set_song

        # called more than once so save as a separate variable
        progression_creator = Progressions::Creator.new(@song, current_user)

        # create the progression
        @progression = progression_creator.create(progression_params).progression

        # unique ID to list the progression until it has a proper tag
        @progression_index = @song.progressions.count

        # alert errors if any
        if @progression.errors.any?
            alert_errors
        end

        if params[:create_another]
            @new_progression = progression_creator.build(@progression).progression
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
