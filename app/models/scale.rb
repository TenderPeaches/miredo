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

    def print_in_key(key)
        output = ""
        
        (1..7).each do |i| 
            puts ('i: ' << i.to_s)
            puts ('key.pitch_class.position: ' << key.pitch_class.position.to_s)
            puts ('get_degrees_interval(i): ' << get_degrees_interval(i).to_s)
            pitch_class__position = (key.pitch_class.position + get_degrees_interval(i)) % 12

            if pitch_class__position == 0
                pitch_class__position = 12
            end

            puts (pitch_class__position)
            puts (PitchClass.find_by(position: pitch_class__position).print)

            output << PitchClass.find_by(position: pitch_class__position).print << " "
        end
        output
    end
end