module InstrumentsHelper
    def piano_pitches(options = {})
        # https://upload.wikimedia.org/wikipedia/commons/a/ad/Piano_key_frequencies.png
        if options[:all]
            Pitch.where("id >= 22").where("id <= 109")
        else
            Pitch.where("id >= 37").where("id <= 101")
        end
    end
end
