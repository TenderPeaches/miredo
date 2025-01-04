class ArtistLink < ApplicationRecord
    belongs_to :song_link_type
    belongs_to :artist
end
