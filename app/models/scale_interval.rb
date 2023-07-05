class ScaleInterval < ApplicationRecord
    belongs_to :scale
    belongs_to :interval
    belongs_to :interval_quality

    # get the difference in semitones between the root and the end of this scale_interval
    def semitones_from_root
        semitones = 0           
        #todo use offset(:nth) to have a "semitones_from_degree" or sth
        scale.scale_intervals.limit(sequence).each do |scale_interval|
            semitones += scale_interval.interval.semitones + scale_interval.interval_quality.modifier
        end
        return semitones
    end
end
