class Artist < ApplicationRecord
    has_many :song_contributions
    has_many :songs, through: :song_contributions
    has_many :album_contributions
    has_many :albums, through: :album_contributions

    def self.for_select
        Artist.order(name: :asc)
    end
end
