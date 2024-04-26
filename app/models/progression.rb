class Progression < ApplicationRecord
    belongs_to :song
    belongs_to :progression_template
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    #before_save :assign_sequence_number
    #after_save :adjust_other_sequence_numbers, if: :saved_change_to_sequence?

    attr_accessor :uid

    def html_lyrics
        html_lyrics = lyrics
        # generate newlines with ; if there is one that immediately follows it
        html_lyrics = html_lyrics.gsub(/;[\w]*\n/, "<br/>")
        # ... or if it ends the lyrics (especially important in order to remove the ; as it's not meant to be printed)
        html_lyrics = html_lyrics.gsub(/;\z/, "<br/>")
        # replace new lines by HTML line breaks
        html_lyrics = html_lyrics.gsub "\n","<br/>"

        html_lyrics.html_safe
    end

    def show_reps?
        reps > 1 || progression_template.reps > 1
    end

    def print_reps
        "x" + (reps * progression_template.reps).to_s
    end

    def duration
        # https://www.rubysos.com/std-lib/how-to-sum-properties-of-the-objects-within-an-array-in-ruby/
        # could also do .map() => .sum()
        progression_template.progression_chords.reduce(0) { |acc, obj| acc + obj.duration}
    end
end
