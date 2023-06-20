class Artist < ApplicationRecord
    has_many :song_contributions
    has_many :songs, through: :song_contributions
    has_many :album_contributions
    has_many :albums, through: :album_contributions
end
