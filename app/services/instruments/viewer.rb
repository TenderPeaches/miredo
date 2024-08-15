module Instruments
    ## creates a viewable form of an instrument, one where some notes may be highlighted according to some scale
    class Viewer
        attr_accessor :capo, :tuning, :fret_count, :key_pitch_ids, :capo_pitch_ids
        def initialize(instrument)
            @instrument = instrument
        end

        ## creates the InstrumentView object that can be rendered
        # instrument_view_params:
        # @tuning_id => Tuning_FK of the instrument being shown
        # @fret_count => int, number of frets being displayed
        # @capo => int, fret where the capo is placed
        # @scale => Scale_FK, scale used for the display
        # @key => Key_FK, key used for the display
        def view(instrument_view_params = {})
            params_tuning = Tuning.includes(:instrument).find_by_id(instrument_view_params[:tuning_id])
            @tuning = if params_tuning.nil? || params_tuning.instrument != @instrument then @instrument.default_tuning else params_tuning end
            @fret_count = instrument_view_params[:fret_count]
            @capo = instrument_view_params[:capo]

            if (instrument_view_params[:pitch_ids])

                @pitch_ids = if instrument_view_params[:pitch_ids].is_a? String then
                    JSON.parse(instrument_view_params[:pitch_ids])
                else
                    instrument_view_params[:pitch_ids]
                end
            else
                @scale = instrument_view_params[:scale]
                @key = instrument_view_params[:key]
                key_with_capo = @key.shift(@capo * -1)

                @display_key = if @instrument.uses_capo then
                    key_with_capo
                else
                    @key
                end

                @pitch_ids = @scale.chords_from_key(@display_key).map {|p| p[:pitch_class_id] }
            end

            InstrumentView.new(@instrument, @tuning, @fret_count, @pitch_ids, @capo)
        end


        private

        class InstrumentView
            attr_reader :tuning, :fret_count, :pitch_ids, :instrument, :capo
            def initialize(instrument, tuning, fret_count, pitch_ids, capo)
                @instrument = instrument
                @tuning = tuning
                @fret_count = fret_count
                @pitch_ids = pitch_ids
                @capo = capo
            end
        end
    end
end
