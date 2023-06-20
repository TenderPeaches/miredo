class Song < ApplicationRecord
    belongs_to :album
    has_many :song_contributions
    has_many :artists, through: :song_contributions
end
