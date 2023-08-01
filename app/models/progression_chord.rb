class ProgressionChord < ApplicationRecord
  belongs_to :chord
  belongs_to :progression
  
  before_save :assign_sequence_number
  
  def assign_sequence_number
    if sequence.nil?
      # OR with 0 because if no other progression_chords, then max will be nil
      self.sequence = (progression.progression_chords.maximum(:sequence) || 0) + 1
    end
  end

  def index 
    @progression_chords = ProgressionChord.all
  end

  def show
  end

  def new
    @progression_chord = ProgressionChord.new
  end

  def edit
  end

  def create
    @progression_chord = ProgressionChord.new(progression_chord_params)

    respond_to do |format|
      if @progression_chord.save
        format.json { render :show, status: :created, location: @progression_chord }
      else        
        format.json { render json: @progression_chord.errors, status: :unprocessable_entity }
      end

    end
  end

  # prints only the chord "C#"
  def print_chord(key, scale)
    # pitch_class associated with this chord given a key and scale, only 12 options
    pitch_class__position = (key.pitch_class.position + scale.get_degrees_interval(degree)) % 12
    # position == 0 doesn't exist, multiples of 12 should have their position set to 12
    if pitch_class__position == 0
      pitch_class__position = 12
    end
    #todo option to use solfège aswell
    PitchClass.find_by(position: pitch_class__position).print + chord.notation
  end

  # prints the chord + duration markers
  def print(key, scale)
    printed = print_chord(key, scale)
    duration.times do |i|
      # separate beats by groups of 4 by prepending a space on the 5th, 9th, 13th, etc. beats
      #todo could be set according to the song's time signature, for 3/4, etc.
      if i > 1 && i % 4 == 0
        printed << " : "
      end
      beat = "– "
      if staccato
        beat = ". "
      elsif muted
        beat = "x."
      end 
      printed << beat
    end
    printed << " "
  end
end
