class Progression < ApplicationRecord
    has_many :song_progressions
    has_many :songs, through: :song_progressions
end
