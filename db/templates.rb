song = Song.find_by_name("")

progression_1 = Progression.create(tag: "")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.song_progressions = [
    SongProgression.create(song: song, progression: progression_1, tag: "", lyrics: ""),
    SongProgression.create(song: song, progression: progression_1, tag: "", lyrics: ""),
]
