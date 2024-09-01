# model controller for progression templates
class ProgressionTemplatesController < ApplicationController

    def index
        @song = Song.includes(:key, :scale, :progression_templates).find_by_id(params[:song_id])

        if @song.can_edit? current_user
            # if the song's key and scale aren't both defined, redirect to the edit song view to let the user define them
            if @song.key.nil? || @song.scale.nil?
                flash[:alert] = "Set the song's key and scale before defining its progressions"
                redirect_to edit_song_path(@song)
            end
        else
            redirect_to new_user_session_path
        end
    end

    # show new progression_template form
    def new
        # if progression_template_id param is set, the form's progression_template should be a copy of the corresponding progression_template
        if params[:progression_template_id]
            original = ProgressionTemplate.find_by_id(params[:progression_template_id])
            @progression_template = original.dup

            # duplicate the original progression's chords
            original.progression_chords.each do |progression_chord|
                @progression_template.progression_chords << progression_chord.dup
            end
            @song = @progression_template.song
        # otherwise, create a new progression from scratch
        else
            @progression_template = ProgressionTemplate.new
            @song = Song.find_by_id(params[:song_id])
            @progression_template.song = @song
        end
    end

    def create
        @progression_template = ProgressionTemplate.new(progression_template_params)
        @song = Song.find_by_id(progression_template_params[:song_id])

        if @song.can_edit? current_user

            @progression_template_index = @song.progression_templates.distinct.count + 1
            update_chords_from_cypher
            @progression_template.save

            if params[:create_another]
                @new_progression_template = @song.progression_templates.build
                render :create_another
            end
        else
            redirect_to new_user_session_path
        end
    end

    def update
        set_progression_template
        @song = @progression_template.song
        if @song.can_edit? current_user

            cypher_interpreter = interpreter
            cypher_interpretation = interpret_cypher cypher_interpreter

            # if the cypher from the chords defined in the user cypher (converting back instead of using the cypher itself to make sure any extra whitespaces are ignored) is identical to the cypher from the progression chords already assigned to this progression template, there is no need to update the chords as they are functionally identical
            unless cypher_interpreter.to_cypher(cypher_interpretation.progression_chords) == cypher_interpreter.to_cypher(@progression_template.progression_chords)
                # otherwise, update the progression chords accordingly - don't try and isolate which ones for now, just dump the whole lot and recreate them. ID real estate is not a concern
                update_chords_from_cypher cypher_interpreter
                @progression_template.save
            end
            @progression_template.update(progression_template_params)
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        set_progression_template

        if @song.can_edit? current_user
            @progression_template.destroy
        end
    end

    private
    def set_progression_template
        @progression_template = ProgressionTemplate.find_by_id(params[:id])
    end

    def set_or_new_progression_template
        unless set_progression_template
            @progression_template = ProgressionTemplate.new
        end
    end

    def interpret_cypher(interpreter = self.interpreter)
        interpreter.from_cypher(params[:progression_template][:cypher])
    end

    def interpreter
        ProgressionTemplates::Interpreter.new(@song.key, @song.scale)
    end

    def update_chords_from_cypher(interpreter = self.interpreter)
        cypher_interpretation = interpret_cypher interpreter
        if cypher_interpretation.valid?
            @progression_template.progression_chords = cypher_interpretation.progression_chords
        end
    end

    def progression_template_params
        params.require(:progression_template).permit(:tag, :uid, :scale, :cypher, :key, :reps, :id, :song_id, progression_chords_attributes: [:id, :degree, :modifier, :bass_modifier, :bass_degree, :chord_id, :duration, :staccato, :muted, :_destroy] )
    end
end
