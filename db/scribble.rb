# when breaking a song donw into its most basic parts, consider:

# SEQUENCE> A part of a song that shares the same Key and BPM
    # most songs should be assumed to be single-sequenced for now but it's good to keep this in mind if more complex song structures are to be implemented at some point
    # BPM> beats per minute
    # KEY> key for this sequence; for a single-sequence song, key of the song too
    # PATTERNS> chord patterns, implemented as generic chords: Minor 5th, etc etc. so that in the end, if it's Am, it's shown as Am
        # CHORD> as Degree so I, i, i7, idim, i6, etc. using SEQUENCE.KEY to determine the final chord that is being played so if I in C then play C
        # PATTERN_CHORD> a chord as part of a pattern, has a duration (in beats) and a sequence number; there should be checks in the model when pattern chords are modified
    # LICKS> or melodies; patterns that are based on notes
    # LYRICS> text that goes alongside the sequence, can match some chord patterns
    # SONG_PATTERNS> of the patterns that exist, which order are they in
    # SONG_LYRICS> of the lyrics that exist, which order are they in

# EXAMPL:

=begin  #replaced with Intervals
Degree.create(position: 1, name: "First")
Degree.create(position: 2, name: "Second")
Degree.create(position: 3, name: "Third")
Degree.create(position: 4, name: "Fourth")
Degree.create(position: 5, name: "Fifth")
Degree.create(position: 6, name: "Sixth")
Degree.create(position: 7, name: "Seventh")
DegreeQuality.create(name: "Major", notation: "M")
DegreeQuality.create(name: "Minor", notation: "m")
DegreeQuality.create(name: "Perfect", notation: "P")
DegreeQuality.create(name: "Augmented", notation: "A")
DegreeQuality.create(name: "Diminished", notation: "d")
=end

# pourrait avoir des intervalles comme ça:
interval__unison = Interval.create(name: "Unison", shorthand: "P1", semitones: 0, class: 0)
interval__minor_second = Interval.create(name: "Minor Second", shorthand: "m2", semitones: 1, class: 1)
interval__major_second = Interval.create(name: "Major Second", shorthand: "M2", semitones: 2, class: 2)
interval__minor_third = Interval.create(name: "Minor Third", shorthand: "m3", semitones: 3, class: 3)
interval__major_third = Interval.create(name: "Major Third", shorthand: "M3", semitones: 4, class: 4)
interval__perfect_fourth = Interval.create(name: "Perfect Fourth", shorthand: "P4", semitones: 5, class: 5)
interval__perfect_fifth = Interval.create(name: "Perfect Fifth", shorthand: "P5", semitones: 7, class: 5)
interval__minor_sixth = Interval.create(name: "Minor Sixth", shorthand: "m6", semitones: 8, class: 4)
interval__major_sixth = Interval.create(name: "Major Sixth", shorthand: "M6", semitones: 9, class: 3)
interval__minor_seventh = Interval.create(name: "Minor Seventh", shorthand: "m7", semitones: 10, class: 2)
interval__major_seventh = Interval.create(name: "Major Seventh", shorthand: "M7", semitones: 11, class: 1)
interval__perfect_octave = Interval.create(name: "Octave", shorthand: "m7", semitones: 12, class: 0)
#... interval__diminished_second = [...]
# ou les séparer en Interval et IntervalQuality
interval_quality__perfect = IntervalQuality.create(name: "Perfect", shorthand: "P", modifier: 0)
interval_quality__minor = IntervalQuality.create(name: "Minor", shorthand: "m", modifier: -1)
interval_quality__major = IntervalQuality.create(name: "Major", shorthand: "M", modifier: 0)
interval_quality__augmented = IntervalQuality.create(name: "Augmented", shorthand: "aug", modifier: 1)
interval_quality__diminished = IntervalQuality.create(name: "Diminished", shorthand: "dim", modifier: -2)

interval__unison = Interval.create(name: "Unison", shorthand: "1", semitones: 0)
interval__second = Interval.create(name: "Second", shorthand: "2", semitones: 2)
interval__third = Interval.create(name: "Third", shorthand: "3", semitones: 4)
interval__fourth = Interval.create(name: "Fourth", shorthand: "4", semitones: 5)
interval__fifth = Interval.create(name: "Fifth", shorthand: "5", semitones: 7)
interval__sixth = Interval.create(name: "Sixth", shorthand: "6", semitones: 9)
interval__seventh = Interval.create(name: "Seventh", shorthand: "7", semitones: 11)
interval__octave = Interval.create(name: "Octave", shorthand: "7", semitones: 12)
    #! à voir si ça serait pas bien de définir les intervalles explicitement (donc rename interval__unison à interval_span__unison or sth), comme ça on aurait pas à gérer les cas invalides genre minor octave ou perfect second; d'un autre côté, ça peut aussi être bêtement géré du côté des vaildations
    #! peut faire ça comme ça pour l'instant, mais devrait probablement faire un test vertical avant de s'engager avec cette méthode là

# ensuite, on crée l'accord 

# accord générique majeur
chord__major_triad = Chord.create(name: "Major Triad", notation: "")
ChordComponent.create(chord: chord__major_triad, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__major_triad, interval: interval__third, interval_quality: interval_quality__major)    # M3 => 4 => E
ChordComponent.create(chord: chord__major_triad, interval: interval__fifth, interval_quality: interval_quality__perfect)  # P5 => 7 => G

chord__minor_triad = Chord.create(name: "Minor Triad", notation: "m")
ChordComponent.create(chord: chord__minor_triad, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__minor_triad, interval: interval__third, interval_quality: interval_quality__minor)    # m3 => 3 => Eb
ChordComponent.create(chord: chord__minor_triad, interval: interval__fifth, interval_quality: interval_quality__perfect)  # P5 => 7 => G
    # => with this, given a key of C, it can construct the Major Triad chord (C) with the given intervals, so C (tonic), E (minor 3rd), G (perfect 5th)
# how to do sevenths and stuff? https://en.wikipedia.org/wiki/Seventh_chord
# look into chords as triads instead, then adding in random notes makes sense
    # however need to also have ScaleInterval or sth
    # https://en.wikipedia.org/wiki/Chord_(music)

    
song = Song.create_or_find_by(name: "Brave as a Noun", album: Album.find_or_create_by(name: ""), number: "", duration: "2", nb_practices: "20", last_practiced: "09/16/2020", capo: "0", chords: "1> C---- 2> C-Am-F-G- x2 3> Am-G-C-F- Am--G-- 1> 2> 3> 3> 1>", lyrics: "1> 2> I could go off the deep end; I can kill all my best friends; I can follow these stylish trends; and god knows I can make amends; but I've got an angry heart; filled with cancer and poppy tarts; if this is how you folks make art; it's fucking depressing; 3> and it's sad to know that we are not alone; and it's sad to know there's no honest way out; 1> 2> I'm afraid to leave the house; I'm as timid as a mouse; I'm afraid if I go out; I'll outwear my welcome; I'm not a courageous man; I don't have any big lasting plans; I'm too cowardly to take a stand; I want to keep my nose clean; 3> and it's sad to know that we're not alone in this; and it's sad to know there's no honest way out; 3> in this life we lead, we could conquer everything; if we could just get the braves to get out of bed in the morning; 1>;")
# This song is in C by default, as indicated by :song.key; beyond its entry in the Song table, it requires the following entries:
progression_1 = Progression.create(tag: "Intro")
ProgressionChord.create(chord: chord__major_triad, degree: 1, duration: 4, sequence: 1, progression: progression_1)  # I ----
progression_2 = Progression.create(tag: "Verse")    # C--Am--F--G--
ProgressionChord.create(chord: chord__major_triad, degree: 1, duration: 2, sequence: 1, progression: progression_2)  # I --
ProgressionChord.create(chord: chord__minor_triad, degree: 6, duration: 2, sequence: 2, progression: progression_2)  # vi --
ProgressionChord.create(chord: chord__major_triad, degree: 4, duration: 2, sequence: 3, progression: progression_2)  # IV --
ProgressionChord.create(chord: chord__major_triad, degree: 5, duration: 2, sequence: 4, progression: progression_2)  # V --
progression_3 = Progression.create(tag: "Chorus")    # Am-G-C-F- Am--G--
ProgressionChord.create(chord: chord__minor_triad, degree: 6, duration: 1, sequence: 1, progression: progression_3)  # vi -
ProgressionChord.create(chord: chord__major_triad, degree: 5, duration: 1, sequence: 2, progression: progression_3)  # V -
ProgressionChord.create(chord: chord__major_triad, degree: 1, duration: 1, sequence: 3, progression: progression_3)  # I -
ProgressionChord.create(chord: chord__major_triad, degree: 4, duration: 1, sequence: 4, progression: progression_3)  # IV -
ProgressionChord.create(chord: chord__minor_triad, degree: 6, duration: 2, sequence: 5, progression: progression_3)  # vi --
ProgressionChord.create(chord: chord__major_triad, degree: 5, duration: 2, sequence: 6, progression: progression_3)  # V --

song.progressions = [
    SongProgression.create(progression: progression_1),
    SongProgression.create(progression: progression_2),
    SongProgression.create(progression: progression_3),
    SongProgression.create(progression: progression_1),
    SongProgression.create(progression: progression_2),
    SongProgression.create(progression: progression_3),
    SongProgression.create(progression: progression_3),
    SongProgression.create(progression: progression_1),
]

# voilà