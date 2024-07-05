module InstrumentsHelper
    def piano_pitches(options = {})
        # https://upload.wikimedia.org/wikipedia/commons/a/ad/Piano_key_frequencies.png
        if options[:all]
            Pitch.where("id >= 22").where("id <= 109")
        else
            Pitch.where("id >= 37").where("id <= 101")
        end
    end

    def instrument_print(instrument_view)
        case instrument_view.instrument
        when Instrument.second
            render "instruments/piano/keys", scale_pitch_ids: instrument_view.pitch_ids
        else
            render "instruments/fretted/view", capo: instrument_view.capo, tuning: instrument_view.tuning, frets: instrument_view.fret_count, accepted_pitch_ids: instrument_view.pitch_ids
        end
    end
end
