class Instrument < ApplicationRecord
    has_many :tunings
    belongs_to :default_tuning, class_name: "Tuning", optional: true

    def self.default
        Instrument.first
    end
end
