class SongLinkType < ApplicationRecord
    has_many :artist_links
    has_many :song_links
end
