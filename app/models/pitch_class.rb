class PitchClass < ApplicationRecord
    has_many :pitches
    has_many :keys

    # return natural pitch classes - so just the letters, no sharps or flats
    def self.natural
        PitchClass.where(letter: ['A', 'B', 'C', 'D', 'E', 'F', 'G'])
    end

    def next
        offset(1)
    end

    def previous
        offset(-1)
    end

    def get_offset(offset = 0)
        # adjust for positive overflow
        if id + offset > PitchClass.count
            PitchClass.find_by_id(id + offset - PitchClass.count)
        # adjust for negative overflow
        elsif id + offset < 1
            PitchClass.find_by_id(id + offset + PitchClass.count)
        # otherwise, id + offset is within [1,12]
        else 
            PitchClass.find_by_id(id + offset)
        end 
    end

    # print relative to another pitch, used especially for sharps/flats
    # !pitch param should be a natural pitch_class, otherwise this will output nonsensical stuff like C#bb
    def print_relative_to(pitch)

        # interval in semitones between the two pitches
        diff = pitch.position - position

        # solving problem case: self = 12 (B), pitch = 1 (C), diff = 1 - 12 = -11         
        if diff < -6
            # turning a large negative gap into a small positive one
            diff += 12
        # solving problem case: self = 1 (C), pitch = 12 (B), diff = 12 - 1 = 11        
        elsif diff > 6
            # turning a large positive gap into a small negative one
            diff -= 12
        end

        # for negative differences, add sharps
        if diff < 0
            pitch.letter + ("#" * diff.abs)
        # for positive differences, add flats
        elsif diff > 0
            pitch.letter + ("b" * diff.abs)
        else
            pitch.letter
        end
    end

    def natural
        # to find the natural pitch class, remove sharps & flats from letter notation by excluding everything but capital letters
        /[A-Z]/.match(letter)[0]
    end

    # get offset pitch class, meaning a pitch class @offset positions away
    def offset(offset)
        # if position + offset > 12, drop down one octave to get the same pitch within the 12 semitones range
        if position + offset > 12
            position + offset - 12
        # same if position < 1, bump it up to within the [1..12] range
        elsif position + offset < 1
            position + offset + 12
        else
            position + offset
        end
    end

    def print
        letter
        #todo setting to use solfege
    end
end
