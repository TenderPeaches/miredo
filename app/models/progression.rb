class Progression < ApplicationRecord
    belongs_to :song
    belongs_to :progression_template
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    before_save :assign_sequence_number
    after_save :adjust_other_sequence_numbers, if: :saved_change_to_sequence?

    attr_accessor :uid

    def assign_sequence_number
      # only assign if none already assigned
      if sequence.nil?
        # get the maximum sequence number for this progression and use that + 1
        sequence = (song.progressions.maximum(:sequence) || 0) + 1
      end
    end

    # when given a sequence number, ensure that it is unique within the song's progressions
    def adjust_other_sequence_numbers
        conflict = false
        # loop over each progression with a sequence number equal or higher to this one
        song.progressions.where(sequence: sequence..).order(:sequence).each do |progression|
            # if there is a sequence conflict, flag it for subsequent loops
            if progression.sequence == sequence && progression.id != id
                conflict = true
            end

            # when there is a conflict
            if conflict
                # bump up each progression's sequence number by 1, unless it is nil
                progression.update(sequence: progression.sequence + 1) unless progression.sequence.nil?
            end
        end
    end

    def html_lyrics
        if lyrics.include? (";")
          html_lyrics = lyrics.gsub ";","<br/>"
          html_lyrics = html_lyrics.gsub "\n","<br/>"
        else
          html_lyrics = "#{lyrics}<br/>"
        end

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
