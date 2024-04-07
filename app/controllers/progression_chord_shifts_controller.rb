class ProgressionChordShiftsController < ApplicationController
    def new
        set_progression_chord

        if @progression_chord
            shift_result = ProgressionChords::Shifter.new(@progression_chord).shift(params[:shift]&.to_i)
        end

        # the progression's display will need to be updated to reflect the chord shift, make sure the view can access it
        @progression_template = @progression_chord.progression_template
    end

    private
    def set_progression_chord
        @progression_chord = ProgressionChord.find(params[:progression_chord_id])
    end

    def shift_params
        params.require(:progression_chord).include(:id)
    end
end
