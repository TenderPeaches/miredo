class Pitch < ApplicationRecord
    belongs_to :pitch_class
    belongs_to :pitch_standard
    has_many :tuning_pitches

    def is_sharp?
        PitchClass.natural.map {|pc| pc.id}.exclude? self.pitch_class.id
    end
end
