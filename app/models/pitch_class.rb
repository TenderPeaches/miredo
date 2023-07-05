class PitchClass < ApplicationRecord
    has_many :pitches
    has_many :keys

    def print
        letter
        #todo setting to use solfege
    end
end
