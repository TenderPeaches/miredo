class Tuning < ApplicationRecord
    has_many :strings, class_name: "TuningPitch"
    has_many :pitches, through: :strings
    belongs_to :instrument

    #! always assume strings have their ID in order of lowest (on the shaft) to highest
    #
    def right_hand_strings
        strings.order(id: :desc)
    end

    def left_hand_strings
        string.order(id: :asc)
    end
end
