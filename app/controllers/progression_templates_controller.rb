class ProgressionTemplatesController < ApplicationController

    def index
        @song = Song.find_by_id(params[:song_id])
    end

    # show new progression_template form
    def new
        # if progression_template_id param is set, the form's progression_template should be a copy of the corresponding progression_template
        if params[:progression_template_id]
            original = ProgressionTemplate.find_by_id(params[:progression_template_id]).dup
            @progression_template = original.dup

            # duplicate the original progression's chords
            original.progression_chords.each do |progression_chord|
                @progression_template.progression_chords = progression_chord.dup
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
        song = Song.find_by_id(progression_template_params[:song_id])
        @progression_template_index = song.progression_templates.distinct.count + 1
        @progression_template.save
    end

    def update
        set_progression_template
        @progression_template.update(progression_template_params)
    end

    def destroy
        set_progression_template
        @progression_template.destroy
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

    def progression_template_params
        params.require(:progression_template).permit(:tag, :uid, :scale, :key, :reps, :id, :song_id, progression_chords_attributes: [:id, :degree, :modifier, :bass_modifier, :bass_degree, :chord_id, :duration, :staccato, :muted, :_destroy] )
    end
end
