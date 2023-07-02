class PitchClass < ApplicationRecord
    has_many :pitches
    has_many :keys
end
