class Key < ApplicationRecord
    belongs_to :pitch_class
    has_many :songs
end
