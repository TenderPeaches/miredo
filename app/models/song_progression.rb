class SongProgression < ApplicationRecord
  belongs_to :song
  belongs_to :progression

  after_save :assign_sequence_number

  def assign_sequence_number
    # only assign if none already assigned
    if sequence.nil?
      # get the maximum sequence number for this progression and use that + 1
      sequence = (song.song_progressions.maximum(:sequence) || 0) + 1
    end
  end

  def html_lyrics
    lyrics#.gsub! ";","<br />"
  end

  def show_reps?
    reps > 1
  end

  def print_reps
    "x" + reps.to_s
  end
end
