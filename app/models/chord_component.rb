class ChordComponent < ApplicationRecord
    belongs_to :chord
    belongs_to :interval
    belongs_to :interval_quality

    def semitones
        self.interval.semitones + self.interval_quality.modifier
    end

    # outputs the component's interval within the chord
    def degree
        # Explicitly name the root, rather than using the technical "Unison" interval
        if interval.id == 1
            "Root"
        else
            "#{interval_quality.name} #{interval.name}"
        end
    end
end
