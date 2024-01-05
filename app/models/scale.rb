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

    #! degrees as labels must vary depending on what kind of chord they are
    def degrees
        # for now, because there aren't all that many scales implemented, just use a switch rather than try to algorithmically figure out the chords
        case id
        when 1      # chromatic
            [ "I".freeze, "II".freeze, "III".freeze, "IV".freeze, "V".freeze, "VI".freeze, "VII".freeze, "VIII".freeze, "IX".freeze, "X".freeze, "XI".freeze, "XII".freeze]
        when 2      # major 
            [ "I".freeze, "ii".freeze, "iii".freeze, "IV".freeze, "V".freeze, "vi".freeze, "vii⁰".freeze ]
        when 3      # natural minor
            [ "i".freeze, "ii⁰".freeze, "III".freeze, "iv".freeze, "v".freeze, "VI".freeze, "VII".freeze ]
        else
            []
        end
        
        # any other case is todo
    end

    def chords
        chord__major = Chord.find_by(name: "Major Triad")
        chord__minor = Chord.find_by(name: "Minor Triad")
        
        chord__diminished = Chord.find_by(name: "Diminished Triad")
        case id
        when 2 
            [ chord__major, chord__minor, chord__minor, chord__major, chord__major, chord__minor, chord__diminished ]
        when 3
            [ chord__minor, chord__diminished, chord__major, chord__minor, chord__minor, chord__major, chord__major ]
        else 
            []
        end
    end 

    # modifier> number of semitones to add to each note
    def get_degree_chords(key, modifier = 0)

        # establish the root position, adjusted with the modifier
        root_position = key.pitch_class.position + modifier
        # make sure the root position within positions [1..12]
        root_position -= 12 if root_position > 12
        root_position += 12 if root_position < 1
        # find the root Pitch Class, with root_position having a value between [1..12]
        root = PitchClass.find_by_position(root_position)
        # current degree tracker
        current_degree = 0
        # the list of chords will, at first, contain only the letter of the root + modifier
        chords = [ { degree: degrees[current_degree], pitch_class: root.letter, pitch_class_id: root.id } ]
        # running_interval is running tally )in semitones) between the root and the current degree/interval being evaluated
        running_interval = 0
        # do each interval in turn
        scale_intervals.each do |scale_interval|
            # track current degree
            current_degree += 1
            # cumulate total interval as we iterate through the scale's individual intervals
            running_interval += scale_interval.semitones
            # ensure final position remains within the 12 pitch classes
            running_interval -= 12 if running_interval + root.position > 12
            # rule this case out otherwise the root gets added as 8th degree
            unless running_interval == 0    
                pitch_class = PitchClass.find_by_position(running_interval + root.position)
                # push the chord's notation accordingly
                chords << { degree: degrees[current_degree], pitch_class: pitch_class.letter, pitch_class_id: pitch_class.id }
            end    
        end
        
        # standardize output
        chords.each_with_index do |chord, i|
            chord[:print] = chord[:pitch_class] + self.chords[i].notation
        end
        return chords
    end

    def chords_from_key(key)
        get_degree_chords(key, 0)
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

            output << "<span class=\"degree-" << i.to_s << "\">" << PitchClass.find_by(position: pitch_class__position).print << "</span> "
        end
        output.html_safe
    end
end