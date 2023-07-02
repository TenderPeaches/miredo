class Chord < ApplicationRecord
    has_many :chord_components
    has_many :intervals, through: :chord_components
    has_many :interval_qualities, through: :chord_components
end
