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

    # degrees as labels must vary depending on what kind of chord they are
    def degrees
        # simplest would be just numeric labels
        [ "I".freeze, "ii".freeze, "iii".freeze, "IV".freeze, "V".freeze, "vi".freeze, "vii".freeze ]
    end

    def chords_from_key(key)
        # start with the root 
        root = PitchClass.find_by_position(key.pitch_class.position)
        chords = [ root.letter ]
        running_interval = 0
        # do each interval in turn
        scale_intervals.each do |scale_interval|
            
            # cumulate total interval as we iterate through the scale's individual intervals
            running_interval += scale_interval.interval.semitones
            # ensure final position remains within the 12 pitch classes
            running_interval -= 12 if running_interval + root.position > 12
            # push the chord's notation accordingly
            chords << PitchClass.find_by_position(running_interval + root.position).letter
            puts "root.position: " << root.position.to_s << " , running_interval: " << running_interval.to_s << ", PitchClass: " << PitchClass.find_by_position(running_interval + root.position).inspect
            
        end
        puts chords.inspect
        return chords
    end

    # print the chords of this scale in the given key
    def print_in_key(key)
        output = ""
        
        # for each of the 7 degrees 
        (1..7).each do |i| 
            #> degree
            puts ('i: ' << i.to_s)
            #> pitch_class
            puts ('key.pitch_class.position: ' << key.pitch_class.position.to_s)
            #> interval (in semitones)
            puts ('get_degrees_interval(i): ' << get_degrees_interval(i).to_s)
            # set the pitch class final position relative to the key's root note & the interval for the given degree, out of 12 possible positions
            pitch_class__position = (key.pitch_class.position + get_degrees_interval(i)) % 12

            # not using 0, using 12 instead so with C = 1, B = 12
            if pitch_class__position == 0
                pitch_class__position = 12
            end
            #> final position 
            puts (pitch_class__position)
            #> final pitch class for this degree
            puts (PitchClass.find_by(position: pitch_class__position).print)

            output << PitchClass.find_by(position: pitch_class__position).print << " "
        end
        output
    end
end