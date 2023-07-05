class ProgressionChord < ApplicationRecord
  belongs_to :chord
  belongs_to :progression
  belongs_to :scale, optional: true

  def print
    #todo option to use solfège aswell
    PitchClass.find_by(position: (get_key.pitch_class.position + get_scale.get_degrees_interval(degree))).print + chord.notation
  end
  # 
  def get_scale
    Scale.find_by(name: "Major")
  end

  def get_key
    Key.find_by(shorthand: "C")
  end

  def get_mode
    # Mode.find_by(name: "Ionian") or whatever
  end
end
