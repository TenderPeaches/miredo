class ChordComponent < ApplicationRecord
    belongs_to :chord
    belongs_to :interval
    belongs_to :interval_quality

    def semitones
        self.interval.semitones + self.interval_quality.modifier
    end
end
