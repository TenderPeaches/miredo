class Scale < ApplicationRecord
    has_many :scale_intervals

    # get interval in semitones between nth degree and scale root
    def get_degrees_interval(degree)
        # 0-index the degree: 1st degree is the root, so it has 0 semitones interval by definition
        scale_intervals.limit(degree - 1).inject(0) { |sum, n| sum + n.interval.semitones + n.interval_quality.modifier }
    end
end
