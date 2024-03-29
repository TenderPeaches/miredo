class ApplicationController < ActionController::Base
    def fretboard
        @key = fretboard_params[:key] ? Key.find_by_id(fretboard_params[:key]) : Key.find_by_shorthand("C")
        @scale = fretboard_params[:scale] ? Scale.find_by_id(fretboard_params[:scale]) : Scale.find_by_name("Major")
        @tuning = Tuning.first
        @frets = 12
        @pitch_classes = PitchClass.all
        @accepted_pitches = @scale.chords_from_key(@key)
        @accepted_pitch_ids = []
        @accepted_pitches.each do |pitch|
            @accepted_pitch_ids << pitch[:pitch_class_id]
        end

        respond_to do |format|
            format.html { render 'instruments/fretboard' }
        end
    end

    private
    def fretboard_params
        params.permit(:scale, :key)
    end
end
