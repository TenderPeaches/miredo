class Key < ApplicationRecord
    belongs_to :pitch_class
    has_many :songs

    def self.for_select
        Key.all
    end
end
