class Tuning < ApplicationRecord
    has_many :strings, class_name: "TuningPitch"
    has_many :pitches, through: :strings
    belongs_to :instrument

    def high_to_low_strings
        strings.order(pitch_id: :desc)
    end
end
