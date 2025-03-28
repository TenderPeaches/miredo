class ChordHelpersController < ApplicationController
	def create
		@instrument = Instrument.find_by_id(params[:instrument_id])
        @capo = params[:capo].to_i
		@capo_relative_pitches = params[:capo_relative_pitches] == "true" || params[:capo_relative_pitches] == "1"

		@song = Song.find_by_id(params[:song])
		@chords = if @capo_relative_pitches && @instrument.uses_capo then
			@song.distinct_chords(@capo * -1)
		else
			@song.distinct_chords
		end

        @key = Key.find_by_id(params[:key])
        @scale = Scale.find_by_id(params[:scale])

		@progression_chord = ProgressionChord.find_by_id(params[:progression_chord_id])

		@instrument_view = Instruments::Viewer.new(@instrument).view({
            fret_count: params[:fret_count]&.to_i || 12,
            tuning_id: @instrument.default_tuning&.id,
            capo: @capo,
            capo_relative_pitches: @capo_relative_pitches,
            key: @key,
            scale: @scale,
			pitch_ids: params[:pitch_ids],
        })

	end
end
