class Album < ApplicationRecord
    has_many :album_contributions
    has_many :artists, through: :album_contributions
    has_many :songs
end
