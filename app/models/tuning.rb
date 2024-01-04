class Tuning < ApplicationRecord
    has_many :strings, class_name: "TuningPitch"
    has_many :pitches, through: :strings

    def low_to_high_strings
        strings.order(pitch_id: :desc)
    end
end
