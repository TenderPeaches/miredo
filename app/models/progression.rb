class Progression < ApplicationRecord
  belongs_to :song
  belongs_to :progression_template
  belongs_to :key, optional: true
  belongs_to :scale, optional: true

  after_save :assign_sequence_number

  attr_accessor :uid

  def assign_sequence_number
    # only assign if none already assigned
    if sequence.nil?
      # get the maximum sequence number for this progression and use that + 1
      sequence = (song.progressions.maximum(:sequence) || 0) + 1
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
