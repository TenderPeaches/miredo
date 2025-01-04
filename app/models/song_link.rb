class SongLink < ApplicationRecord
    belongs_to :song_link_type
    belongs_to :song
end
