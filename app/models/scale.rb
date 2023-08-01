class Scale < ApplicationRecord
    has_many :scale_intervals

    # get interval in semitones between nth degree and scale root
    def get_degrees_interval(degree)
        # 0-index the degree: 1st degree is the root, so it has 0 semitones interval by definition
        scale_intervals.limit(degree - 1).inject(0) { |sum, n| sum + n.interval.semitones + n.interval_quality.modifier }
    end

    def self.for_select
        Scale.where.not(id: [1])    # don't return scale #1, it's the chromatic scale and shouldn't be selected for songs; use Scale.all if it needs to be included
    end
end
