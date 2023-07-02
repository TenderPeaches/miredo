class Pitch < ApplicationRecord
  belongs_to :pitch_class
  belongs_to :pitch_standard
end
