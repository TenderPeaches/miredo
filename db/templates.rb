# for seeding song progressions

song = Song.find_by(name: "")
progression_ = Progression.create(tag: "")
progression_.progression_chords = [
    ProgressionChord.create(chord: chord__, degree: , duration: ),
    ProgressionChord.create(chord: chord__, degree: , duration: ),
]

SongProgression.create(song: song, progression: progression_, tag: "", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_, tag: "", lyrics: "", reps: 1)