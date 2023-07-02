class Interval < ApplicationRecord
    has_many :chord_components
    has_many :chords, through: :chord_components
end
