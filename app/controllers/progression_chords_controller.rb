class ProgressionChordsController < ApplicationController
    def new
        @progression_template = ProgressionTemplate.find_by_id(params[:progression_template_id]) || ProgressionTemplate.new(song_id: params[:song_id])
        @progression_chord = @progression_template.progression_chords.build
    end

    def create
        #? necessary?
        if progression_chord_params[:id] > 0
            update
        else
            @progression_chord = ProgressionChord.new(progression_chord_params)
            @progression_chord.save
        end
    end

    def update
        @progression_chord = ProgressionChord.find_by_id(progression_chord_params[:id])
        @progression_chord.update
    end

    private
    def progression_chord_params
        params.require(:progression_chord).permit(:progression_template_id, :chord_id, :degree, :duration, :modifier, :bass_modifier, :bass_degree, :sequence)
    end
end
