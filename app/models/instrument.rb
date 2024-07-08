class Instrument < ApplicationRecord
    has_many :tunings
    belongs_to :default_tuning, class_name: "Tuning", optional: true
    belongs_to :instrument_template, optional: true

    def self.default
        Instrument.first
    end
end
