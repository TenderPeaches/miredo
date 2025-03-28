class ScaleInterval < ApplicationRecord
    belongs_to :scale
    belongs_to :interval
    belongs_to :interval_quality

    # get the difference in semitones between the root and the end of this scale_interval
    def semitones_from_root
        semitones_from_root = 0
        #todo use offset(:nth) to have a "semitones_from_degree" or sth
        scale.scale_intervals.limit(sequence).each do |scale_interval|
            semitones_from_root += scale_interval.semitones
        end
        return semitones_from_root
    end

    # get the total semitones of this interval within the scale
    def semitones
        interval.semitones + interval_quality.modifier
    end

    def print
        # no need to make it more complicated, as there won't be a need to use anymore than these seven numerals
        roman_numerals = ["I", "II", "III", "IV", "V", "VI", "VII"]

        #! Because of the way triads are computed according to the intervals, the 1st degree/root actually matches the scale_interval with sequence 7, as it's the interval that leads to the root. This also doesn't need to be 0-indexed because this interaction cancels it, meaning the scale_interval with sequence 1 indicates the second triad, with a 0-index of 1
        interval = roman_numerals[sequence % 7]

        case triad
        when :minor
            interval.downcase
        when :major
            interval.upcase
        when :augmented
            "#{interval.upcase}+"
        when :diminished
            "#{interval.downcase}°"
        else
            interval
        end
    end

    def triad
        root = semitones_from_root
        # +1 is actually +2-1, taking into account the 0-indexed array of intervals as sequence is 1-indexed
        third = scale.scale_intervals[(sequence + 1) % 7].semitones_from_root
        fifth = scale.scale_intervals[(sequence + 3) % 7].semitones_from_root

        interval_third = (third - root) % 12
        interval_fifth = (fifth - root) % 12

        #debug puts "Interval: #{[root, third, fifth, interval_third, interval_fifth, sequence].to_s}"

        case interval_third
        when 3
            case interval_fifth
            when 7
                :minor
            when 6
                :diminished
            end
        when 4
            case interval_fifth
            when 7
                :major
            when 8
                :augmented
            end
        else
            :other
        end
    end
end
