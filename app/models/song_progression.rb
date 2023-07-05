class SongProgression < ApplicationRecord
  belongs_to :song
  belongs_to :progression

  def html_lyrics
    lyrics.gsub! ";","<br />"
  end
end
