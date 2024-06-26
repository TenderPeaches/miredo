song = Song.find_by_name("")

progression_template_1 = ProgressionTemplate.create(tag: "")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "", lyrics: ""),
]
