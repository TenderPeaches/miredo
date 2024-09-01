# progressions model controller
class ProgressionsController < ApplicationController

    def index
        @song = Song.includes(:progressions, :progression_templates).find_by_id(params[:song_id])

        if !(@song.can_edit? current_user)
            redirect_to new_user_session_path
        end
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

        if !@song.can_edit? current_user
            redirect_to new_user_session_path
        end
    end

    def create
        set_song

        if @song.can_edit? current_user

            # called more than once so save as a separate variable
            progression_creator = Progressions::Creator.new(@song, current_user)

            # create the progression
            @progression = progression_creator.create(progression_params).progression

            # unique ID to list the progression until it has a proper tag
            @progression_index = @song.progressions.count

            if params[:create_another]
                @new_progression = progression_creator.build(@progression).progression
                render :create_another
            else
                render :create
            end
        else
            redirect_to new_user_session_path
        end
    end

    def update
        set_progression

        if @progression.song.can_edit? current_user
            @progression.update(progression_params)
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        set_progression


        if @song.can_edit? current_user
            @progression.destroy
        end
    end

    private
    def set_progression
        @progression = Progression.find_by_id(params[:id])
    end

    def set_song
        @song = Song.includes(:progressions).find_by_id(params[:song_id])
    end

    def set_progression_template
        @progression_template = ProgressionTemplate.find_by_id(params[:progression_template_id])
    end

    def alert_errors
        flash.now[:alert] = t('alerts.invalid_form', model: t('activerecord.models.progression'), errors: @progression.errors.full_messages)
    end

    def progression_params
        params.require(:progression).permit(:progression_template_id, :song_id, :uid, :tag, :lyrics, :reps, :key_id, :scale_id, :sequence)
    end
end
