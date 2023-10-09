class Key < ApplicationRecord
    belongs_to :pitch_class
    has_many :songs

    def shift(shift) 
        shifted_key = pitch_class_id + shift
        shifted_key -= 12 if shifted_key > 12
        shifted_key += 12 if shifted_key < 1
        Key.find_by(pitch_class_id: shifted_key, quality: quality)
    end

    def self.for_select
        Key.all
    end
end
