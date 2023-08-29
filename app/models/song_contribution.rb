class SongContribution < ApplicationRecord
    belongs_to :song
    belongs_to :artist, optional: true
end
