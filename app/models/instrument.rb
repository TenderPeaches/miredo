class Instrument < ApplicationRecord
    has_many :tunings
    belongs_to :default_tuning, class_name: "Tuning", optional: true
    belongs_to :instrument_template, optional: true

    def self.default
        Instrument.first
    end

    def capo_range
        range = case self.instrument_template.id
        when 1 then
            -1..10
        when 2 then
            nil
        when 3 then
            0..7
        end

        range.to_a
    end
end
