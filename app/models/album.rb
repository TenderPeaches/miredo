class Album < ApplicationRecord
    has_many :contributions
    has_many :artists, through: :contributions
    has_many :songs
end
