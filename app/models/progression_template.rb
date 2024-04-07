class ProgressionTemplate < ApplicationRecord
    has_many :progressions
    has_many :progression_chords, dependent: :destroy
    has_many :chords, through: :progression_chords
    belongs_to :song
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    accepts_nested_attributes_for :progression_chords, allow_destroy: true

    attr_accessor :uid

    public
    # need to sort progression_templates in order to show user a list to select from somehow
    # sort by each chord that makes up the progression_template
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

    def active_key
        if key
            key
        elsif song.key
            song.key
        else
            Key.first
        end
    end

    def active_scale
        if scale
            scale
        elsif song.scale
            song.scale
        else
            Scale.second
        end
    end

    # display in a given key for a select box
    def print(key = active_key, scale = active_scale)
        printed = ""
        ordered_chords.each do |pc|
            # duration string to be appended to a chord, for instance the "----" part of C#----, denoting number of beats
            duration_string = ""

            if pc.duration
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
            end
            printed << pc.print_chord(key, scale) << duration_string
        end
        return printed
    end

    def print_for_select
        "#{tag} (#{print(active_key, active_scale)} x#{reps.to_s})"
    end

    def print_bars(key, scale)
        printed = ""
        ordered_chords.each do |pc|

        end
    end
end
