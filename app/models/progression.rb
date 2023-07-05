class Progression < ApplicationRecord
    has_many :song_progressions
    has_many :songs, through: :song_progressions
    has_many :progression_chords
    has_many :chords, through: :progression_chords
end
