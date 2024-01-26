class SongProgression < ApplicationRecord
  belongs_to :song
  belongs_to :progression
  belongs_to :key, optional: true
  belongs_to :scale, optional: true

  after_save :assign_sequence_number

  attr_accessor :uid

  def assign_sequence_number
    # only assign if none already assigned
    if sequence.nil?
      # get the maximum sequence number for this progression and use that + 1
      sequence = (song.song_progressions.maximum(:sequence) || 0) + 1
    end
  end

  def html_lyrics
    if lyrics.include? (";")
      html_lyrics = lyrics.gsub ";","<br/>"
      html_lyrics = html_lyrics.gsub "\n","<br/>"
    else 
      "#{lyrics}<br/>"
    end
  end

  def show_reps?
    reps > 1 || progression.reps > 1
  end

  def print_reps
    "x" + (reps * progression.reps).to_s
  end
end
