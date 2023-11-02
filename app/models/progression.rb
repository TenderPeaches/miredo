class Progression < ApplicationRecord
    has_many :song_progressions
    has_many :songs, through: :song_progressions
    has_many :progression_chords
    has_many :chords, through: :progression_chords
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    accepts_nested_attributes_for :progression_chords

    public
    # need to sort progressions in order to show user a list to select from somehow
    # sort by each chord that makes up the progression
    def sortable
        sortable_string = ""
        ordered_chords.each do |pc|
            sortable_string << pc.degree.to_s << "(" << pc.duration.to_s << ")"
        end
        return sortable_string
    end

    def ordered_chords
        progression_chords.order(:sequence)
    end

    # display in a given key for a select box
    def print(key, scale)
        printed = ""
        ordered_chords.each do |pc|
            # duration string to be appended to a chord, for instance the "----" part of C#----, denoting number of beats
            duration_string = ""

            pc.duration.times do 
                # regular chords use dashes
                duration_char = '-'
                if pc.staccato 
                    # for staccato, use dots
                    duration_char = '.'
                elsif pc.muted
                    # for muted chords, use Xs
                    duration_char = 'x'
                end
                # concatenate the character with the full duration string
                duration_string << duration_char
            end
            printed << pc.print_chord(key, scale) << duration_string
        end
        return printed
    end

    def print_bars(key, scale)
        printed = ""
        ordered_chords.each do |pc|
            
        end
    end
end
