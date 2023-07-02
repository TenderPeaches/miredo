class ChordComponent < ApplicationRecord
  belongs_to :chord
  belongs_to :interval
  belongs_to :interval_quality
end
