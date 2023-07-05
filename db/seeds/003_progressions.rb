# brave as a noun
song = Song.find(1)
progression_1 = Progression.create(tag: "Intro")
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 1, duration: 4, sequence: 1, progression: progression_1)  # I ----
progression_2 = Progression.create(tag: "Verse")    # C--Am--F--G--
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 1, duration: 2, sequence: 1, progression: progression_2)  # I --
ProgressionChord.create(chord: Chord.find_by(name: "Minor Triad"), degree: 6, duration: 2, sequence: 2, progression: progression_2)  # vi --
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 4, duration: 2, sequence: 3, progression: progression_2)  # IV --
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 5, duration: 2, sequence: 4, progression: progression_2)  # V --
progression_3 = Progression.create(tag: "Chorus")    # Am-G-C-F- Am--G--
ProgressionChord.create(chord: Chord.find_by(name: "Minor Triad"), degree: 6, duration: 1, sequence: 1, progression: progression_3)  # vi -
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 5, duration: 1, sequence: 2, progression: progression_3)  # V -
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 1, duration: 1, sequence: 3, progression: progression_3)  # I -
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 4, duration: 1, sequence: 4, progression: progression_3)  # IV -
ProgressionChord.create(chord: Chord.find_by(name: "Minor Triad"), degree: 6, duration: 2, sequence: 5, progression: progression_3)  # vi --
ProgressionChord.create(chord: Chord.find_by(name: "Major Triad"), degree: 5, duration: 2, sequence: 6, progression: progression_3)  # V --

song.song_progressions = [
    SongProgression.create(progression: progression_1, sequence: 1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_2, sequence: 2, tag: "Verse 1", lyrics: "I could go off the deep end; I can kill all my best friends; I can follow these stylish trends; and god knows I can make amends; but I've got an angry heart; filled with cancer and poppy tarts; if this is how you folks make art; it's fucking depressing;"),
    SongProgression.create(progression: progression_3, sequence: 3, tag: "Chorus 1", lyrics: "and it's sad to know that we are not alone; and it's sad to know there's no honest way out;"),
    SongProgression.create(progression: progression_1, sequence: 4, tag: "Post-Chorus", lyrics: ""),
    SongProgression.create(progression: progression_2, sequence: 5, tag: "Verse 2", lyrics: "I'm afraid to leave the house; I'm as timid as a mouse; I'm afraid if I go out; I'll outwear my welcome; I'm not a courageous man; I don't have any big lasting plans; I'm too cowardly to take a stand; I want to keep my nose clean;"),
    SongProgression.create(progression: progression_3, sequence: 6, tag: "Chorus 2A", lyrics: "and it's sad to know that we're not alone in this; and it's sad to know there's no honest way out;"),
    SongProgression.create(progression: progression_3, sequence: 7, tag: "Chorus 2B", lyrics: "in this life we lead, we could conquer everything; if we could just get the braves to get out of bed in the morning;"),
    SongProgression.create(progression: progression_1, sequence: 8, tag: "Outro", lyrics: ""),
]
