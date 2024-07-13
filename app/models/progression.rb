class Progression < ApplicationRecord
    belongs_to :song
    belongs_to :progression_template
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    #before_save :assign_sequence_number
    #after_save :adjust_other_sequence_numbers, if: :saved_change_to_sequence?

    attr_accessor :uid

    def effective_key
        if self.key
            self.key
        elsif progression_template.key
            progression_template.key
        elsif song.key
            song.key
        else
            Key.default
        end
    end

    def effective_scale
        if self.scale
            self.scale
        elsif progression_template.scale
            progression_template.scale
        elsif song.scale
            song.scale
        else
            Scale.default
        end
    end

    def html_lyrics
        html_lyrics = lyrics
        # generate newlines with ; if there is a newline that immediately follows it
        #! still need to figure out what to do with semi-columns, maybe run a script that replaces all with linebreaks \n
        #html_lyrics = html_lyrics.gsub(/;[\w]*\n/, "<br/>")
        # replace ; with new line
        html_lyrics = html_lyrics.gsub(/;/, "<br/>")
        # ... or if it ends the lyrics (especially important in order to remove the ; as it's not meant to be printed)
        html_lyrics = html_lyrics.gsub(/;\z/, "<br/>")
        # replace new lines by HTML line breaks
        html_lyrics = html_lyrics.gsub "\n","<br/>"
        html_lyrics = html_lyrics.gsub "<br/><br/>", "<br/>"

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
