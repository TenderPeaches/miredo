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
        render "instruments/#{instrument_view.instrument.instrument_template.filename}", instrument_view: instrument_view
    end
end
