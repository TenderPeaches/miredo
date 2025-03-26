class InstrumentTemplate < ApplicationRecord
    has_many :instruments

    # whether this type of instrument has a fretboard
    def has_fretboard?
        # Template ID must match: Guitar, 5-string Banjo
        [1, 3].include? self.id
    end
end
