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

  def get_scale_notes(key, scale)
    flats = [ 'B', 'E', 'A', 'D', 'G', 'C', 'F' ]
    sharps = [ 'F', 'C', 'G', 'D', 'A', 'E', 'B' ]
  end

  # when # or b are applied, need to figure out whether to flatten a given degree or to sharpen another
  def assess_scale_notes(key, scale)
    pitch_classes = PitchClass.all
    # doesn't apply to chromatic scale
    return pitch_classes if key == Key.find_by_name("Chromatic")

    # linking a degree-indexed hash with a given pitch class, to make sure that each pitch class appears exactly once in the hash
    natural_pitches = PitchClass.natural

    notes = {}
    degrees = {}
    statuses = {}

    # process:
    # use the key's flats/sharps values to figure out whether we are adding sharps or flat
    if key.flats > 0 
      process = "flatten"
    elsif key.sharps > 0
      process = "sharpen"
    else
      process = "nothing"
    end

    # the ONLY certainty is degree 1, which matches the scale tonic. Everything else follows from the tonic & the scale intervals
    degrees[1] = key.pitch_class.letter
    notes[key.pitch_class.letter] = 1
    statuses[1] = 'final'

    # keep track of the current interval
    running_interval = 0


    # check the other degrees in sequence
    (2..8).step(1) do |i|
      # increment the running interval by however many semitones to go from degree i-1 to degree i
      # using where(sequence: i - 1) because the 1st interval is used to infer the 2nd degree
      running_interval += scale.scale_intervals.where(sequence: i - 1).first.semitones

      # pitch offset by running_interval from the scale tonic
      running_pitch = pitch_classes.find_by_position(key.pitch_class.offset(running_interval))

      # try to assess with degree
      # if natural pitch == running_pitch, then running_pitch is already natural
      if (running_pitch.natural == running_pitch.letter)
        #! assume ok but actually is not in some edge cases
        statuses[i] = 'natural'
        degrees[i] = running_pitch.letter
        notes[running_pitch.letter] = i
      # else if the natural version of the running pitch is lower
      elsif (natural_pitches.find_by(letter: running_pitch.natural).position < running_pitch.position)
        puts "natural is lower"
        puts degree.inspect << notes.inspect << statuses.inspect
        puts "natural: " << natural_pitches.find_by(letter: running_pitch.natural).inspect << ", running: " << running_pitch.inspect
        statuses[i] = "lower_natural"
        #if notes.key?()
        degrees[i]
      # else, the natural version of the running pitch is higher
      else 
        puts "natural is higher"
        puts degree.inspect << notes.inspect << statuses.inspect
        puts running_interval.to_s << " " << running_pitch.inspect
        statuses[i] = "higher_natural"
      end
    end

    pitch_classes.each do |pc|

    end
  end

  # prints only the chord "C#"
  def print_chord(key, scale)

    # pitch_class associated with this chord given a key and scale, only 12 options
    pitch_class__position = (key.pitch_class.position + scale.get_degrees_interval(degree) + modifier) % 12
    # position == 0 doesn't exist, multiples of 12 should have their position set to 12
    if pitch_class__position == 0
      pitch_class__position = 12
    end
    #todo option to use solfège aswell
    PitchClass.find_by(position: pitch_class__position).print + chord.notation
  end



  # prints the chord + duration markers
  def print(key, scale)
    # output
    printed = ""

    # print the main chord
    printed << print_chord(key, scale)
    
    # print the bass chord if present
    unless bass_degree.nil?
      #! use a separate method, standardise with print_chord
      bass__pitch_class__position = (key.pitch_class.position + scale.get_degrees_interval(bass_degree) + bass_modifier) % 12
      if bass__pitch_class__position == 0
        bass__pitch_class__position = 12
      end
      printed << "/" << PitchClass.find_by(position: bass__pitch_class__position).print
    end

    duration.times do |i|
      # separate beats by groups of 4 by prepending a space on the 5th, 9th, 13th, etc. beats
      #todo could be set according to the song's time signature, for 3/4, etc.
      if i > 1 && i % 4 == 0
        printed << " : "
      end
      beat = " –"
      if staccato
        beat = ". "
      elsif muted
        beat = "x."
      end 
      printed << beat
    end
    printed << " "
  end

  def print_with_colors(key, scale)
    "<span class=\"degree-".html_safe + degree.to_s + "\">".html_safe + print(key, scale) + "</span>".html_safe
  end
end
