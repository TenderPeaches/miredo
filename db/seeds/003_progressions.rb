# shortcuts
chord__major = Chord.find_by(name: "Major Triad")
chord__minor = Chord.find_by(name: "Minor Triad")
chord__seventh = Chord.find_by(name: "Dominant Seventh")
chord__minor_seventh = Chord.find_by_notation("m7")
chord__major_seventh = Chord.find_by(notation: "maj7")
chord__diminished = Chord.find_by(name: "Diminished Triad")
chord__suspended_fourth = Chord.find_by(name: "Suspended Fourth")
chord__seventh_suspended_fourth = Chord.find_by(name: "Seventh Suspended Fourth")
chord__double_suspended = Chord.find_by(name: "Double Suspended")

# brave as a noun - ajj
song = Song.find_by_name("Brave as a Noun")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1, progression_template: progression_template_1)  # I ----
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")    # C--Am--F--G--
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1, progression_template: progression_template_2)  # I --
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, sequence: 2, progression_template: progression_template_2)  # vi --
ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 3, progression_template: progression_template_2)  # IV --
ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 4, progression_template: progression_template_2)  # V --
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")    # Am-G-C-F- Am--G--
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1, progression_template: progression_template_3)  # vi -
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 2, progression_template: progression_template_3)  # V -
ProgressionChord.create(chord: chord__major, degree: 1, duration: 1, sequence: 3, progression_template: progression_template_3)  # I -
ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 4, progression_template: progression_template_3)  # IV -
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 5, progression_template: progression_template_3)  # vi --
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 6, progression_template: progression_template_3)  # V --
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 7, progression_template: progression_template_3)  # I ----

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 2, tag: "Verse 1", lyrics: "I could go off the deep end; I can kill all my best friends; I can follow these stylish trends; and god knows I can make amends;"),
    Progression.create(progression_template: progression_template_2, sequence: 2, tag: "Verse 1", lyrics: "but I've got an angry heart; filled with cancer and poppy tarts; if this is how you folks make art; it's fucking depressing;"),
    Progression.create(progression_template: progression_template_3, sequence: 3, tag: "Chorus 1", lyrics: "and it's sad to know that we are not alone; and it's sad to know there's no honest way out;"),
    Progression.create(progression_template: progression_template_1, sequence: 4, tag: "Post-Chorus", lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 5, tag: "Verse 2", lyrics: "I'm afraid to leave the house; I'm as timid as a mouse; I'm afraid if I go out; I'll outwear my welcome;"),
    Progression.create(progression_template: progression_template_2, sequence: 5, tag: "Verse 2", lyrics: "I'm not a courageous man; I don't have any big lasting plans; I'm too cowardly to take a stand; I want to keep my nose clean;"),
    Progression.create(progression_template: progression_template_3, sequence: 6, tag: "Chorus 2A", lyrics: "and it's sad to know that we're not alone in this; and it's sad to know there's no honest way out;"),
    Progression.create(progression_template: progression_template_3, sequence: 7, tag: "Chorus 2B", lyrics: "in this life we lead, we could conquer everything; if we could just get the braves to get out of bed in the morning;"),
    Progression.create(progression_template: progression_template_1, sequence: 8, tag: "Outro", lyrics: ""),
]

# we shall all die alone someday - ajj
song = Song.find(2)
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 1, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 2, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 3, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 4, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 5, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 6, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 7, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 8, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 9, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 10, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 11, progression_template: progression_template_2)
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Ending")
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 1, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 2, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 3, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 4, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 5, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 6, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 7, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 8, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 9, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 10, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 11, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 12, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 13, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 14, progression_template: progression_template_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 15, progression_template: progression_template_3)

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 2, tag: "Verse 1", lyrics: "Bad things happen everyday; cancer and murder and herpes and AIDS; we'll all die alone someday; I hope we don't die alone;"),
    Progression.create(progression_template: progression_template_2, sequence: 3, tag: "Verse 2", lyrics: "And our vices make it bearable enough; to know our lives are shit, but to not give a fuck; They make it bearable enough to help us on our way;"),
    Progression.create(progression_template: progression_template_2, sequence: 4, tag: "Verse 3", lyrics: "But still it feels nice to feel alive; To try to find a home or someplace to thrive; It feels great to be alive except for all those times we feel dead;"),
    Progression.create(progression_template: progression_template_2, sequence: 5, tag: "Verse 4", lyrics: "And how do we maintain our buoyancy; in this salty lake of shit and tears and murder and disease? How do we keep ourselves afloat in all this sad stuff?"),
    Progression.create(progression_template: progression_template_3, sequence: 6, tag: "Intro", lyrics: "I've gotta know the answers I've gotta know it now; And I need to know the answers I have to know how; We'll all die alone someday, I hope we don't die alone;"),
]

# forest fire - ajj
song = Song.find_by_name("Forest Fire")
progression_template_1 = ProgressionTemplate.create(song: song, tag: 'Verse')
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 1, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 2, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 4, sequence: 3, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 4, sequence: 4, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 5, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 6, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 7, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 8, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 9, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 10, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 11, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(song: song, tag: 'Chorus')
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 1, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 2, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 3, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 4, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 5, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 6, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 7, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 8, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 9, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 10, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 11, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 12, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 13, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 14, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 15, progression_template: progression_template_2)

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Verse 1", lyrics: "Waking from napping with a bad taste in your mouth; Wishing you were sleeping, you don't want to leave the house; Dripping from your dreaming of a habit you renounced; Get out of bed, please go away, get out, get out, get out;"),
    Progression.create(progression_template: progression_template_1, sequence: 2, tag: "Verse 2", lyrics: "You see a liar in the mirror he's sneering in that way; That makes you feel unsafe, insane and you hate to see his face; You punch the mirror to shut him up but he won't go away; He just multiplies, intensifies, he's twenty tiny blades; "),
    Progression.create(progression_template: progression_template_2, sequence: 3, tag: "Chorus", lyrics: "Is it getting better? It's really getting worse; I'll give a thousand apologies for a thousand hurts; The forest is on fire but we're gonna let it burn; We're controlling it; We've got it handled; Thanks for your concern;"),
]

# A Song Dedicated to the Memory of Stormy the Rabbit - AJJ
song = Song.find_by_name("A Song Dedicated to the Memory of Stormy the Rabbit")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse A")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 2, progression_template: progression_template_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 3, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse B")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 2, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 3, progression_template: progression_template_2)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, sequence: 4, progression_template: progression_template_2)
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Ending")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression_template: progression_template_3)

song.progressions = [
    Progression.create(progression_template: progression_template_2, sequence: 1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 2, tag: "Verse 1", lyrics: "For four fortnights I have fled from my fortress"),
    Progression.create(progression_template: progression_template_1, sequence: 3, tag: "Verse 1", lyrics: "Foraging forests five footsteps in length"),
    Progression.create(progression_template: progression_template_1, sequence: 4, tag: "Verse 1", lyrics: "Fortitude found within forty ounce bottles"),
    Progression.create(progression_template: progression_template_2, sequence: 5, tag: "Verse 1", lyrics: "Flowing like flies from your face; From your face;"),
    Progression.create(progression_template: progression_template_1, sequence: 6, tag: "Verse 2", lyrics: "And my neighborhood; It's been filled brim with black cats"),
    Progression.create(progression_template: progression_template_2, sequence: 7, tag: "Verse 2", lyrics: "And when I go driving they walk in my path all the time; Every time;"),
    Progression.create(progression_template: progression_template_1, sequence: 8, tag: "Interlude", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 9, tag: "Interlude", lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 10, tag: "Interlude", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 11, tag: "Verse 3", lyrics: "First we were babies, we're birthing and dying"),
    Progression.create(progression_template: progression_template_1, sequence: 12, tag: "Verse 3", lyrics: "Then we were children, we're playing and crying"),
    Progression.create(progression_template: progression_template_1, sequence: 13, tag: "Verse 3", lyrics: "And then we're teenagers and smoking and fucking;"),
    Progression.create(progression_template: progression_template_1, sequence: 14, tag: "Verse 3", lyrics: "But now we're all grown up and we're sadly sighing;"),
    Progression.create(progression_template: progression_template_1, sequence: 15, tag: "Verse 3", lyrics: "And lacking but lurking, and licking our wounds;"),
    Progression.create(progression_template: progression_template_1, sequence: 16, tag: "Verse 3", lyrics: "We've created by lusting and lying to ourselves and to others;"),
    Progression.create(progression_template: progression_template_2, sequence: 17, tag: "Interlude", lyrics: "We're sadly sighing x4;"),
    Progression.create(progression_template: progression_template_1, sequence: 18, tag: "Verse 4", lyrics: "And I'd like to be a big ball of meat;"),
    Progression.create(progression_template: progression_template_2, sequence: 19, tag: "Verse 4", lyrics: "That bees can buzz around and eat when I die; So that I might be granted one sense of purpose;"),
    Progression.create(progression_template: progression_template_3, sequence: 20, tag: "Ending", lyrics: ""),
]

# love in the time of hpv - ajj
song = Song.find_by_name("Love in the Time of Human Papillovirus")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Riff")

progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")

progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus A")

progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus B")

progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "You will cough up crows that peck my eyes; And I will do nothing but go blind;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "But my heart; It has eyes; And my love; It has sight; Even though; It may be a little cloudy;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "And you will break my back for all the burdens I lay upon it; But I will never blame you for those bees inside this bonnet;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "And my lungs; Will grow cancers; And my back it will grow achey; I will buy us an acre; Of some land in the city; We could live there together or I'll live alone less happy; But I'll live... Unfortunately;"),
    Progression.create(progression_template: progression_template_1, tag: "Ending", lyrics: ""),
]

# kokopelli face tattoo - ajj
song = Song.find_by_name("Kokopelli Face Tattoo")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse B")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, bass_degree: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, modifier: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 3, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Interlude (short)")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Interlude (long)")
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, modifier: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1),
]

progression_template_7 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_7.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__diminished, degree: 3, duration: 2, modifier: -1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_8 = ProgressionTemplate.create(song: song, tag: "Verse C")
progression_template_8.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, bass_degree: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "I was a sexy little viper room, in the corner of a King Tut tomb; When the hate train started, goin' \"Choo-choo\""),
    Progression.create(progression_template: progression_template_3, tag: "Verse 1", lyrics: "I was a rat on a burnin' ship, and when we sunk, our fire got put out; It was just like the great plague, just like the birth of underwear"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less"),
    Progression.create(progression_template: progression_template_5, tag: "Interlude 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "I was a wheel in a war machine, now I’m a toilet in a restaurant; Somebody’s gotta do it, I know my place"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "I was a baby-killin' Cadillac, Now I’m a drug induced heart attack; Somebody’s gotta do it, I know my place"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less"),
    Progression.create(progression_template: progression_template_6, tag: "Interlude 2", lyrics: ""),
    Progression.create(progression_template: progression_template_7, tag: "Bridge", lyrics: "Have you ever wanted to be, have you ever wanted to see; Someone better, in the mirror? Have you ever wanted to go, have you ever wanted to know; Somewhere greener? Somewhere cleaner?; I bet you've got somethin' beautiful in mind"),
    Progression.create(progression_template: progression_template_8, tag: "Verse 3", lyrics: "They’re gonna beat me till I’m black and blue; Give me a Kokopelli face tattoo; And I’ll tell you a secret; \"Kreuz\" is German for \"Williams\"; In the blood cult of the misled youth; I’ve got a bad case of the yellow flashlight blues; Let me tell you some weird shit; There's gonna be a big old Civil War inside my house tonight"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 3", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less; Hating you won’t make you suck any less; Hating you won’t make you suck any less"),
]

# bill collector's theme song - apes of the state
song = Song.find_by_name("Bill Collectors' Theme Song")

progression_template_1 = ProgressionTemplate.create(song: song, tag:"Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag:"Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag:"Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag:"Bridge 1")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Bridge 2")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Ending")
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "When I was just a little kid they told me to dream big; you can do anything; when I got older they told me to stop dreaming; start being more realistic, make the coffee do the dishes; but I can't seem to keep my head out of the clouds; cause whats the point of living life; to work until I die; That can't be it and if it is then I want out; and honestly I never had a dream of getting older; but here I am what can I do about it, tell me what to do about it now;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Cause I never wanted to be every single stereotype of a white middle class 20-something pissed at the economy; I never meant to be the epitome of a quarter life crisis and being a junkie didn't live up to the hype;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "When I was just a little kid they told me I was special; Then I grew up and found out they told that to every single one of us; get addicted to our drugs then go away to universities; where we'll sell you dreams then make you work for free; They handed us an economy thats destined us for poverty; then had the nerve to call us soft and lazy for complaining; cause they're from a generation where you could be what you wanted to be; but baby I'm a 90's kid, only 90's kids will understand this;"),
    Progression.create(progression_template: progression_template_4, tag: "Bridge", lyrics: "got bill collectors calling us to pay back student loans; but they can't ever find us if we throw away our phones; then we can sit in diners, drinking coffee smoking cigarettes outside; look in each others' eyes without cell phone lights to hide behind and; we can just kick off our shoes and make these sidewalks home; we'll write songs and sing for food;"),
    Progression.create(progression_template: progression_template_5, tag: "Bridge", lyrics: "and we'll never be alone; never be alone, never be alone, never be alone when we're with friends; and we'll never owe shit to anyone else; no we'll never owe shit to anyone else; no we'll never owe shit to anyone else; no we'll never owe shit to anyone;"),
    Progression.create(progression_template: progression_template_6, tag: "Ending", lyrics: ""),
]

# I listened - apes of the state

song = Song.find_by_name("I Listened")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 8),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Last night when I walked into your house I noticed that the couch had moved; And I wanted to ask you about it; But you were talking so when you finished I opened up my mouth; And you called me out for being bad at listening; So I wrote this song to tell ya just how well that I can listen; And that I think that you are really cute; And I thought that maybe I should wait to tell you that I like you but; I don't really have that much to lose; "),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "And I could learn your favorite song and play it on my guitar; and I'll probably sing it all wrong but it might catch your attention; and I don't know your favorite song but it's probably by Mars Volta; cause you said you really like them when we talked and I listened; yeah I listened;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "So this morning when I woke up in my bed I made a list of all the things you told me last night that I had inside my head; like that yellow is your favorite because it's a happy color; and that you have been sad for as long as you remember; and that the way your kitchen looked made you upset because it was a mess and that's the way things look when you're depressed; and you sat across the room on that rocking chair you said you hate cause it is so loud and I wished that you had sat next to me on the couch;"),
    Progression.create(progression_template: progression_template_2, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "And I'm scared that this list is too long; That I can't fit all these things into a song; And still keep your attention; So I'm trying hard to mention some important things that I feel will really demonstrate; Just how well that I listened;"),
    Progression.create(progression_template: progression_template_2, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "Like how you said with tears in your eyes that you wish that being grateful was enough to keep you from feeling sad all the time; And that your favorite flowers are impatiens; And that when you love somebody you wait; Patiently for them; 2> And that your favorite movie is the Shawshank Redemption; And that serenity means listening to the water down at Tucquan Glenn; And how you make poor decisions with the people that you choose to date;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 5", lyrics: "And you'll probably think I'm crazy for this and I'd tell you that I don't give a shit but that would be a lie because I care; What you think about me; And I just really, desperately want to be your next poor decision; Be your next poor decision; Be your next poor decision;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "And I could learn your favorite song and play it on my guitar; and I'll probably sing it all wrong but it might catch your attention; and I don't know your favorite song but it's probably by Mars Volta; cause you said you really like them when we talked and I listened; yeah I listened;"),
    Progression.create(progression_template: progression_template_1, tag: "Ending", lyrics: ""),
]

# honey in the air - blackbird raum
song = Song.find_by(name: "Honey in the Hair")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 4)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Bridge", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Ending", reps: 6)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "I fill my mouth up with air, honey in the hair; Honey in the hair, honey in the hair; I fill my life up with time, asleep in the vine; Whiskey and wine, whiskey and wine; Who makes the wind blow; I don't care, my eyes roll back in my head; Who makes the wind blow; I don't care, my eyes roll back in my head; I'm just walking in circles; I see the lines in chalk on the ground; I'm just walking in circles; I see the lines in chalk on the ground;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "I fill my mouth up with air; honey in the hair; Honey in the hair, honey in the hair; I fill my life up with time, asleep in the vine; Whiskey and wine, whiskey and wine; Who makes the wind blow; I don't care, my eyes roll back in my head; Who makes the wind blow; I don't care, my eyes roll back in my head; I'm just walking in circles; I see the lines in chalk on the ground; I'm just walking in circles; I see the lines in chalk on the ground; "),
    Progression.create(progression_template: progression_template_2, tag: "Bridge", lyrics: "One day this will all come down; One day this will all come crashing right down;"),
    Progression.create(progression_template: progression_template_3, tag: "Ending", lyrics: "So go on with your life; We will bring you down; One day this will all come down; One day this will all come crashing right down; So go on with your life; We will bring you down;"),
]

# coal - blackbird raum
song = Song.find_by_name("Coal")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 4)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Break", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Riff 1", reps: 8)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Bridge", reps: 8)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "the pillars of the world were shaking like the legs of a drunk; hot winds ripped the hats off all the ladies all about town that day; then they caught us ran us ragged beat us bloody put us in a dirty cage; now we're screaming bloody murder we are starving won't see the ocean side again; now we're screaming bloody murder we are starving won't see the ocean side again;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "continents and mountain ranges boats out in the harbor; rivers clouds and cities all aflame; the sun went out the sky went red the horses our dancing in their skins; the taste of ash and sulfur on our lips; Where is my boy, where is my son. I seem to have lost him in the crowd; he was holding to my hand just a moment ago; I know he cannot find his way he is so small he is so lean he looks like; a scrap of paper on a branch;", reps: 2),
    Progression.create(progression_template: progression_template_3, tag: "Riff", lyrics: ""),
    Progression.create(progression_template: progression_template_4, tag: "Bridge", lyrics: "I am flesh and you are pale, I am sleeping you are dead; we're all playing cards as the ship goes down; We're living as if we are not, hanging from a precipice; shuddering and lurching off the edge; but someday this will all be gone, as fast a match can be struck; take warning for the veil is very thin; the signs aren't difficult to read: we tread so heavy on the ground; and one day the ground it may give way; "),
    Progression.create(progression_template: progression_template_2, tag: "Break 2", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "I see you gilded gentlemen, I wish I'd set a torch to you while I still had the freedom of my legs; I do not trust you with my life; I do not trust you with my past I do not trust your hands upon the world; but now I'm sunken in the ground, all my strength to move is gone; and screaming is the last recourse that I have; you've left us with a barren earth, we know we are the aching land; a scorching waste with all the life of coal;", reps: 2),
    Progression.create(progression_template: progression_template_3, tag: "Outro", lyrics: ""),
]

# devil's will - cousin boneless
song = Song.find_by_name("Devil's Will")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")

ProgressionChord.create(progression_template: progression_template_1, chord: chord__minor, degree: 4, duration: 8, sequence: 1)
ProgressionChord.create(progression_template: progression_template_1, chord: chord__minor, degree: 1, duration: 4, sequence: 2)
ProgressionChord.create(progression_template: progression_template_1, chord: chord__minor, degree: 4, duration: 4, sequence: 3)
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
ProgressionChord.create(progression_template: progression_template_2, chord: chord__minor, degree: 1, duration: 1, sequence: 1)
ProgressionChord.create(progression_template: progression_template_2, chord: chord__major, degree: 6, duration: 1, sequence: 2)
ProgressionChord.create(progression_template: progression_template_2, chord: chord__major, degree: 7, duration: 1, sequence: 3)
ProgressionChord.create(progression_template: progression_template_2, chord: chord__major, degree: 5, duration: 1, sequence: 4)
ProgressionChord.create(progression_template: progression_template_2, chord: chord__minor, degree: 4, duration: 1, sequence: 5)

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 2, tag: "Verse 1", lyrics: "Tonight I'll play in the Devil's way; Tonight I'll do what my demons say; As they whisper, in such a subtle way"),
    Progression.create(progression_template: progression_template_1, sequence: 3, tag: "Verse 1", lyrics: "Tonight I'll sing of the Devil's things; Friendly fire and playful stings; We will grin while the church bells ring"),
    Progression.create(progression_template: progression_template_2, sequence: 4, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;"),
    Progression.create(progression_template: progression_template_2, sequence: 5, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;"),
    Progression.create(progression_template: progression_template_1, sequence: 6, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 7, tag: "Verse 2", lyrics: "Tonight I'll feast with the feral beasts; With heavy breath and sharpened teeth; Keep the bones, savor the meat"),
    Progression.create(progression_template: progression_template_1, sequence: 8, tag: "Verse 2", lyrics: "Our glasses clink with the Devil's drink; In a raised whiskey bottle we all will sink; And we'll find, what the Devil thinks"),
    Progression.create(progression_template: progression_template_2, sequence: 9, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;"),
    Progression.create(progression_template: progression_template_2, sequence: 10, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;"),
    Progression.create(progression_template: progression_template_1, sequence: 11, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 12, tag: "Verse 3", lyrics: "Tonight I'll dance in the Devil's fire; Throw myself in, add to the pyre; To admire, so much to desire"),
    Progression.create(progression_template: progression_template_1, sequence: 13, tag: "Verse 3", lyrics: "Tonight I'll sleep by the Devil's cheek; As she culls with a lullaby so sweet; How unique, how the serpent speaks"),
    Progression.create(progression_template: progression_template_2, sequence: 14, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;"),
    Progression.create(progression_template: progression_template_2, sequence: 15, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;"),
    Progression.create(progression_template: progression_template_1, sequence: 16, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, sequence: 17, tag: "Verse 3", lyrics: "Tonight we'll fulfill the Devil's will; Sign fine lines with a bloody quill; What was killed, well it suffers still"),
    Progression.create(progression_template: progression_template_2, sequence: 18, tag: "Chorus B", lyrics: "So come with us, we've got so much to tell;"),
    Progression.create(progression_template: progression_template_2, sequence: 19, tag: "Chorus B", lyrics: "And if we dig real deep I bet we can reach hell;"),
]

# helm of ned kelly - blackbird raum
song = Song.find_by_name("The Helm of Ned Kelly")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    # Gm Cm Bb Eb Gm Cm Em
    # Gm Cm F D
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Outro", reps: 8, key: Key.find_by_shorthand("Am"), scale: Scale.find_by_name("Natural Minor"))
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Like a fist clutching bread; just to hoard and withhold like the grain that they locked in the silo; we'll be eating soup of stone til what we grow is what we own; but we won't steal from the land what's freely given; tear up the deeds to the land, throw the debts into the furnace; debts to god to the banks and to the landlord; don your armor don your helm, which was forged from an old plows blade; train your horses round and aim your guns at sydney;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "down their lying in the brush was one bloody tethered horse; and one detective in the service of the crown; even though we're just one pistol against an army of policemen; I insist that we are many and they are few;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "it was on van dieman's land where your father came in transport; chained like cattle to the deck of a ship; held hostage in a word, stolen from the shores of erin; south australia bound in bondage of the queen's men; tear up the deeds to the land, throw the debts into the furnace; debts to god to the banks and to the landlord; don your armor don your helm, which was forged from an old plows blade; train your horses round and aim your guns at sydney;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    Progression.create(progression_template: progression_template_3, tag: "Outro", lyrics: ""),
]

# germinal - blackbird raum
song = Song.find_by_name("Germinal")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, modifier: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "see how fast I can run,see how fast I can run; a window is closed in the cold, race up the stairs with a friend; sit in the hall; stare at a wall;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    Progression.create(progression_template: progression_template_2, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "the one with the cold metal hands, up on a table undone; a tube in my womb all again, the breath and the clothes of a friend; close my eyes, a placenta dies;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    Progression.create(progression_template: progression_template_2, tag: "Bridge", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Bridge", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Bridge", lyrics: ""),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 3", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    Progression.create(progression_template: progression_template_2, tag: "Outro", lyrics: ""),
]

# witches - blackbird raum
song = Song.find_by(name: "Witches")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 4),
]
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 2),
]
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 2),
    ProgressionChord.create(chord: Chord.find_by(name: "Dominant Seventh"), degree: 5, duration: 4, sequence: 3),
]
progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 2, tag: "Verse 1", lyrics: "in others' mouths, a scraping of rocks; who walk a rope, run along the ground, into the basket;"),
    Progression.create(progression_template: progression_template_2, sequence: 3, tag: "Verse 1", lyrics: " whither the sky is fatted of ice; come as the earth grows richer of blood; the doe is in season;"),
    Progression.create(progression_template: progression_template_3, sequence: 4, tag: "Pre-Chorus 1", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;"),
    Progression.create(progression_template: progression_template_4, sequence: 5, tag: "Pre-Chorus 1", lyrics: ""),
    Progression.create(progression_template: progression_template_4, sequence: 6, tag: "Chorus 1", reps: 3, lyrics: "but it won't be the witches that are burning this time; and it won't be the witches that are burning this time; but it won't be the witches that are burning this time;"),
    Progression.create(progression_template: progression_template_1, sequence: 7, tag: "Post-Chorus 1", reps: 2, lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 8, tag: "Verse 2", lyrics: "out in the wood, a passing of hours; in the jailhouse of limb, a passing of years, into the casket; "),
    Progression.create(progression_template: progression_template_2, sequence: 9, tag: "Verse 2", lyrics: "I will not crouch, polluted with law; no traitor to witch, not traitor to wolf, judas escariot;"),
    Progression.create(progression_template: progression_template_3, sequence: 10, tag: "Pre-Chorus 2", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;"),
    Progression.create(progression_template: progression_template_4, sequence: 11, tag: "Pre-Chorus 2", lyrics: ""),
    Progression.create(progression_template: progression_template_4, sequence: 12, tag: "Chorus 2", reps: 3, lyrics: "but it won't be the witches that are burning this time; and it won't be the witches that are burning this time; but it won't be the witches that are burning this time;"),
    Progression.create(progression_template: progression_template_1, sequence: 13, tag: "Post-Chorus 2", reps: 4, lyrics: ""),
    Progression.create(progression_template: progression_template_2, sequence: 14, tag: "Verse 3", lyrics: "now the white wool is twisted round the land; the cowering altar and matricide borne, the stones they are screaming; "),
    Progression.create(progression_template: progression_template_2, sequence: 15, tag: "Verse 3", lyrics: "I could call them men but they are not men, faces like blood rags; yet dressed to the fines, chariots surround us; "),
    Progression.create(progression_template: progression_template_3, sequence: 16, tag: "Pre-Chorus 3", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;"),
    Progression.create(progression_template: progression_template_4, sequence: 18, tag: "Chorus 3", lyrics: "but it won't be the witches burning this time;"),
]

# plastic plague - broken bow
song = Song.find_by_name("Plastic Plague")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "We're the murders of the machine; these doomed dinosaurs of iron; that choke away all of our dreams; leaving nightmares for us to lead;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Plastic plague; plastic plague;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "When you wake to a shrouded brown sky; with mushroom clouds and toxic smoke in your eyes; it is terrifying; we despise;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Plastic plague; plastic plague;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: " why do the powers that be always Bogart; all the free and clean energy; oh they trade it for coal and dead dinosaurs; and deaf ears to fall on our pleas;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 3", lyrics: "Plastic plague; plastic plague;"),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: "sterilize; genocide; equalize; ignite; god damn their eyes;", reps: 2),
]

# scraps - broken bow
song = Song.find_by_name("Scraps")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Break")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "[Quiet]"),
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "[Fast]"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "indoctrined insignificance eats at your mortal soul; diligence and duty freedom dies it takes its toll; the noose around your neck will tighten, death will strengthen hold; for years the flesh that was your heart has slowly turned to coal;"),
    Progression.create(progression_template: progression_template_1, tag: "Pre-Chorus 1", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    Progression.create(progression_template: progression_template_2, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "the blood the sweat and tears collect inside a little cup; you can't go back the clock ticks on the years you've given up; what i wouldn't give just to have another day at work; you sigh and rest, fall into death, you've finally out of luck; "),
    Progression.create(progression_template: progression_template_1, tag: "Pre-Chorus 2", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    Progression.create(progression_template: progression_template_2, tag: "Break 2", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "a cog inside an iron lung whose gears they have been jammed; by feeding fingers to a starving dog right from the masters hand; a glutton for envy, your life has been bought; your slaves have been caught, just leave us to rot;"),
    Progression.create(progression_template: progression_template_3, tag: "Bridge", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Solo", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 3", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 4", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; and you will beg for death before the end;"),
]

# digitize the dirt - broken bow
song = Song.find_by_name("Digitize the Dirt")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "There's a tourniquet around your neck to quench a bloody mind; let's drag our bodies to the woods and leave this filthy world behind; for shame the world, accursed world for shame; to play the game that points the blame to anyone but me;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "but me, but me, but me; we'll point it at anyone but me; what about you, its so fucking true; but me;"),
    Progression.create(progression_template: progression_template_1, tag: "Pre-Chorus 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "so let's mine the moon; let's put a colony on mars; let's kill the green in all the world; and snuff out all the stars;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "cuz there's candlelight at dinner in an alley; there's fire burning all over this town; when this is over we will throw a party or a war; go to the city and burn it fucking down; "),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "so let's digitize the dirt; and chastise the sky; lets hollow out the planet earth; and leave the rest to die;"),
]

# no earthlings - broken bow
song = Song.find_by_name("No Earthlings")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 1),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "well little did I know at the end of this road; the only way out was through a broken door; take your cards as they come, let chips fall; this life is a gamble so heed the last call;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "find myself again at the foot of this bed; visions of demons dance around in my head; the ugly truth is I'm not dead; we're just dying;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Pre-Chorus 1", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "but I can't see past the clouds at night; helpless birds robbed of their flight; people are praying, false gods will delight; for no answers no reasons, no end is in sight;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "a little bit of sleep will go a long way; if you see your blood it will break your day; unwind my mind claw at my face; and help me end this human race;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Bridge", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Bridge", lyrics: "no answers, no reasons; no earthlings, no seasons; no answers, no reasons; no earthlings, no seasons;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "but i can't see past my eyes at night; desperate dreams robbed of their light; people are praying, no end is in sight; for no answers, no earthlings, no season to die;", reps: 2),
]

# lights - broken bow

song = Song.find_by_name("Lights")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Bridge Ending")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Ending")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "when the lights go down in the city; just know they did not shine for me; just the moonlight on the water and the dew upon the leaves; not oil in a puddle or broken glass litters the streets;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Chorus", lyrics: "cuz im running out of town; meanwhile im running out on time; maybe one of these days I'll make it, if I dont I'll surely die; but when my time has come, I will know, I've heard the angels cry;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Bridge", lyrics: "so lets let the ashes of our time fall slowly 'till the wind can blow them away; cuz there ain't much left in this town that can still convince me to stay; we're just creating and destroying, the fate with which we're molding fades away;", reps: 3),
    Progression.create(progression_template: progression_template_3, tag: "Bridge", lyrics: "but in the end, i'm just happy to survive another day;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "when the lights go down in the city; just know they did not shine for me; just the moonlight on the water and the dew upon the leaves; not oil in a puddle or broken glass litters the streets;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "cuz im running out of town; meanwhile im running out on time; maybe one of these days I'll make it, if I dont I'll surely die; but when my time has come, I will know, I've heard the angels cry; ", reps: 2),
    Progression.create(progression_template: progression_template_4, tag: "Ending", lyrics: "", reps: 2),
]

# wrought iron bars - broken bow
song = Song.find_by_name("Wrought Iron Bars")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 3),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse Ending A")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse Ending B")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 6),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 3),
    Progression.create(progression_template: progression_template_2, tag: "Intro", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Time is cloaked in harmony; thrown out of the woods taken to the cities; break the bonds of deliquency;", reps: 3),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "by cutting the wires of your technocracy;", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "the bread that they feed us with leashes they lead us; on collars and dollars and riding on air; we're laundering, pondering, squatting your lives away;", reps: 3),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "steal your master's horses; your daughter's bobbles and drink all the wine;", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "we fester sequester; we beg to be pleased;", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "we find that all rows lead us back to our feet;", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "we stretch out the sinew yet still we continue; to spread it so think you can't notice it gone; no shackles will keep you so the poison still seeps through;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "and I cannot sleep 'till the first light of dawn;", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Verse 4", lyrics: "Bags are whipped; lips are sewn shut; men are equipped; and the lifelines, the lifelines are cut; the cycle is ending yet we keep pretending; and blending and spending 'till we drown out the sea; the furnace is burning, the furnace is churning out;", reps: 3),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "the furnace is churning out wrought iron bars;", reps: 1),
]

# berceuse pour les pas fins
song = Song.find_by_name("Berceuse pour les Pas Fins")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2, modifier: -1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Crève mon sale, t'es un mangeux de marde; Un maudit crotté, un malade mental; M'as te faire poignarder; Tu mériterais de te faire passer; Dessus par un char ou un camion à ciment;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Crève mon sale, t'es un pédophile; Un mangeux de crapauds; Tu sens la canisse d'huile; T'es un sniffeux de moppe; Un licheux de poubelle; J'te clouerais la langue dans le front; Pis je te ferais dire \"ananas\";"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "Crève mon sale, m'as te faire empailler; Pis m'as te tirer dessus; M'as dire à tout le monde que t'aime le fuschia; Tu mériterais juste que je t'arrache les deux yeux; Pis que je les passe dans mon broyeur;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 4", lyrics: "Crève mon sale, m'a envoyer mon chien pisser sue ta tombe; Je vais aller te déterrer pour te voir pourrir; Je vais remplir ton trou avec des déchets dangereux; Pis je vais mettre le feu dedans;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 5", lyrics: "Crève mon sale...; T'es un maudit écoeurant laid; Pis tu sens le swing; Tu marches comme un canard; Tu t'exprimes mal; Ton linge est même pas beau; Pis ta mère a le cul large; Comme un autobus (Pis quand t'embrasses ta soeur tu t'gênes pas s'a langue);"),
]

# my immortal - evanescence
song = Song.find_by(name: "My Immortal")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2, sequence: 2),
]
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 5),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 6),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 7),
]
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 4),
]
progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus End")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, sequence: 3),
]
progression_template_5 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2, sequence: 5),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 6),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 7),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 8),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, sequence: 1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, sequence: 2, tag: "Verse 1", lyrics: "I'm so tired of being here; Suppressed by all my childish fears; And if you have to leave; I wish that you would just leave; 'Cause your presence still lingers here; And it won't leave me alone;", reps: 4),
    Progression.create(progression_template: progression_template_2, sequence: 3, tag: "Pre-Chorus 1", lyrics: "These wounds won't seem to heal; This pain is just too real; There's just too much that time cannot erase"),
    Progression.create(progression_template: progression_template_3, sequence: 4, tag: "Chorus 1", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears; And I held your hand through all of these years;", reps: 3),
    Progression.create(progression_template: progression_template_4, sequence: 5, tag: "Chorus 1", lyrics: "But you still have all of me;"),
    Progression.create(progression_template: progression_template_1, sequence: 6, tag: "Post-Chorus 1", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, sequence: 7, tag: "Verse 2", lyrics: "You used to captivate me by your resonating light; Now I'm bound by the life you left behind; Your face, it haunts my once pleasant dreams; Your voice, it chased away all the sanity in me;", reps: 4),
    Progression.create(progression_template: progression_template_2, sequence: 8, tag: "Pre-Chorus 2", lyrics: "These wounds won't seem to heal; This pain is just too real; There's just too much that time cannot erase"),
    Progression.create(progression_template: progression_template_3, sequence: 9, tag: "Chorus 2", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears; And I held your hand through all of these years;", reps: 3),
    Progression.create(progression_template: progression_template_4, sequence: 10, tag: "Chorus 2", lyrics: "But you still have all of me;"),
    Progression.create(progression_template: progression_template_5, sequence: 11, tag: "Bridge", lyrics: "I've tried so hard to tell myself that you're gone; But though you're still with me; I've been alone all along;"),
    Progression.create(progression_template: progression_template_4, sequence: 12, tag: "Bridge", lyrics: ""),
    Progression.create(progression_template: progression_template_3, sequence: 13, tag: "Chorus 3", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears; And I held your hand through all of these years;", reps: 3),
    Progression.create(progression_template: progression_template_4, sequence: 14, tag: "Chorus 3", lyrics: "But you still have all of me;"),
]

# empress bridge - days n daze

song = Song.find_by_name("Empress Bridge")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Bridge", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "a concrete monstrosity to replace the place you loved; you told me all those stories now those photos that you took are all thats left; besides the memories they tore it down brought in machines; to lay the concrete paint the lines you didnt even get to;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "say good bye to something beautiful; goodbye to something pure; it seems that overnight those bastards changed the wood to stone; that bridge might just have been the final anchor; holdin' this ship down at port now; they'll set sail for something better; but find their compass doesn't work;"),
    Progression.create(progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "a desolate wasteland a desert of pavement; were spiraling deeper yet most are complacent; the green has vanished and the grey has taken over (the world is becoming so monochromatic); when the sun goes down the stars dont shine; the night sky is polluted with light; and at dawn the smog fades colors in the sunrise;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "say good bye to something beautiful; goodbye to something pure; it seems that overnight those bastards changed the wood to stone; that bridge might just have been the final anchor; holdin' this ship down at port now; they'll set sail for something better; but find their compass doesn't work;"),
    Progression.create(progression_template: progression_template_3, tag: "Break 2", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "a field for a blacktop a tree for a pillar; unchain mothernature with stripmalls you'll kill her; a blanket of concrete to cover the planet; they need it to live but they take it for granted; so tear down and clear out and build up some more; replace all the forests with theme parks and stores; what the fuck are you waiting for go on drop the bombs;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "say good bye to something beautiful; goodbye to something pure; it seems that overnight those bastards changed the wood to stone; that bridge might just have been the final anchor; holdin' this ship down at port now; they'll set sail for something better; but find their compass doesn't work;"),
    Progression.create(progression_template: progression_template_4, tag: "Verse 4", lyrics: "plant shovels in my chest; to dig out any hope thats left; replace my skeleton with rebar; my blood with gasoline my heart is just; a cold steel engine now; my veins are copper wire; I feel nothing; except gears turning to pave the green away;"),
]

# the flatlands - days'n'daze

song = Song.find_by_name("The Flatlands")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Post-Chorus", reps: 3)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Break", reps: 2)
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Bridge pt. 1", reps: 2)
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_7 = ProgressionTemplate.create(song: song, tag: "Bridge pt. 2", reps: 3)
progression_template_7.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_8 = ProgressionTemplate.create(song: song, tag: "Bridge pt. 3")
progression_template_8.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "I swear my eyes are rotting out the back of my head; jaw's locked open I'm chained to a mattress; anxiety is tearin' at the flesh around my quivering limbs; finger on the trigger and a bullet in the gun; to contemplate the exit's only half of the fun; I'm fucking sick of this body; lets burn it and start over new;"),
    Progression.create(progression_template: progression_template_1, tag: "Post-Verse 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "I'm the deafening silence; that trails the bad news; I'm a drunk and a fuckup with nothing to lose; I'm a skeleton covered in scar covered skin in your closet; like a car crash that steals all the ones that you love; or a missile thats whistling lullabies from up above; I've been staring at the television; trying to envision what your head would look like on a stake;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "We're all just screaming along; to this broken record still; and i just can't take this anymore; when every days a photocopy of the day before; one day you'll die and all you'll leave behinds a corpse;"),
    Progression.create(progression_template: progression_template_4, tag: "Post-Chorus", lyrics: "My lungs are collapsing anxieties cracking; my heart into shards that will lodge in my chest; breathing but barely I'm fighting I'm gasping; for air now I'm not sure theres any hope left;", reps: 3),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "We're all just screaming along; to this broken record still; and i just can't take this anymore; when every days a photocopy of the day before; one day you'll die and all you'll leave behinds a corpse;"),
    Progression.create(progression_template: progression_template_5, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_6, tag: "Bridge", lyrics: "Soon the earth the sun and the dark rift will all align; to bring the oceans crashing on to land with rising tide; when there's plague and famine ravaging across the wartorn land; are you still so high and mighty when there's nothing in your hands;"),
    Progression.create(progression_template: progression_template_7, tag: "Bridge", lyrics: "Soon these scars will fade like all the rest; i need your bullshit like a bullet in my chest; all your problems are so trivial of yourself are so full;"),
    Progression.create(progression_template: progression_template_8, tag: "Bridge", lyrics: "When the end is growing near; and we're all trading off our souls; if you cower on your knees ill put a bullet in your skull;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 3", lyrics: "We're all just screaming along; to this broken record still; and i just can't take this anymore; when every days a photocopy of the day before; one day you'll die and all you'll leave behinds a corpse;"),
]

# hitchin' a ride - green day

song = Song.find_by_name("Hitchin' a Ride")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2, modifier: -1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2, modifier: -1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Solor", reps: 8)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Outro", reps: 8)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Hey mister, where you headed; Are you in a hurry; I need a lift to happy hour; Say oh no; Do you brake for distilled spirits; I need a break as well; The well that inebriates the guilt; 1, 2. 1, 2, 3, 4;", reps: 8),
    Progression.create(progression_template: progression_template_1, tag: "Break 1", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Cold turkey's getting stale, tonight I'm eating crow; Fermented salmonella poison oak no; 1> There's a drought at the fountain of youth, and now I'm dehydrating; My tongue is swelling up, as say 1, 2. 1, 2, 3, 4;", reps: 8),
    Progression.create(progression_template: progression_template_1, tag: "Break 2", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "Troubled times, you know I cannot lie; I'm off the wagon and I'm hitchin' a ride;", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Break 3", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "There's a drought at the fountain of youth, and now I'm dehydrating; My tongue is swelling up, I say shit;", reps: 3),
    Progression.create(progression_template: progression_template_3, tag: "Solo", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "Troubled times, you know I cannot lie; I'm off the wagon and I'm hitchin' a ride;"),
    Progression.create(progression_template: progression_template_4, tag: "Outro", lyrics: "I'm hitchin' a ride; I'm hitchin' a ride; I'm hitchin' a ride; I'm hitchin' a ride; I'm hitchin' a ride; I'm hitchin' a ride; I'm hitchin' a ride;"),
]

# good riddance - green day


song = Song.find_by_name("Good Riddance (Time of our Lives)")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Another turning point, a fork stuck in the road; Time grabs you by the wrist, directs you where to go;"),
    Progression.create(progression_template: progression_template_3, tag: "Pre-Chorus 1", lyrics: "So make the best of this test, and don't ask why; It's not a question, but a lesson learned in time;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "It's something unpredictable, but in the end is right; I hope you had the time of your life;"),
    Progression.create(progression_template: progression_template_2, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "So take the photographs, and still frames in your mind; Hang it on a shelf in good health and good time;"),
    Progression.create(progression_template: progression_template_3, tag: "Pre-Chorus 2", lyrics: "Tattoos of memories and dead skin on trial; For what it's worth it was worth all the while;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "It's something unpredictable, but in the end is right; I hope you had the time of your life;"),
    Progression.create(progression_template: progression_template_2, tag: "Post-Chorus 2", lyrics: ""),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 3", lyrics: "It's something unpredictable, but in the end is right; I hope you had the time of your life;"),
    Progression.create(progression_template: progression_template_5, tag: "Outro", lyrics: ""),
]

# what's a devil to do - harley poe

song = Song.find_by_name("What's a Devil to Do")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 8),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 5),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "I was born from an angel, And she raised me properly; I knew what I wasn't to do, I knew what I wasn't to see; But when you reach a certain age, Your destiny, it comes to life; So don't you bite the hand that feeds you, Or it may cut you with its knife; It permeates all through my bones, I let it live, I help it grow; I said my cup it runneth over, Well I'm gonna let it flow; So I shot a man in muncie, just to watch him die; My mother asked me if it pleased me, And I couldn't tell a lie;", reps: 4),
    Progression.create(progression_template: progression_template_2, tag: "Pre-Chorus 1", lyrics: "Now Jesus died for them, it's true; But what's a devil to do?"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Oh when the saints go marching in, I won't be there, 'cause I love my sin; Am I so bad that you hate me, There was a time when I could see; My hopes and dreams, they are no more, I'm not a rich man, but blessed are the poor; Oh man, forgive me, I turned away, I won't come back, so I have to pay;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: "", reps: 3),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: " And now there is rules to life, I know, And if you follow them you'll go; Up to the mountains and the clouds, And where the golden rivers flow; But I've always been so good at breaking all the rules; I wasn't made to be their robot, And I ain't nobody's fool; I am the goat that got away, But I know there will come a day; When I'll be punished for my mind, 'Cause I led myself astray; I am a work of art, I know, I was created but down below; And if it's evil that you're planting, Then it's evil that will grow;", reps: 3),
    Progression.create(progression_template: progression_template_2, tag: "Pre-Chorus 2", lyrics: "Now Jesus died for them, it's true; But what's a devil to do?"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Oh when the saints go marching in, I won't be there, 'cause I love my sin; Am I so bad that you hate me, There was a time when I could see; My hopes and dreams, they are no more, I'm not a rich man, but blessed are the poor; Oh man, forgive me, I turned away, I won't come back, so I have to pay;"),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: "", reps: 4),
]

# everybody knows my name - harley poe

song = Song.find_by_name("Everybody Knows my Name")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro", reps: 3)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 12),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 16),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 16),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 8),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 3)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Chorus Ending")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Outro", reps: 8)
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "I'm the one, I am ignored, When your teenagers are bored; Foolishness will hand their careless lives to me; They don't fear what they don't know, Through their ignorance I glow; As they flicker from this dream I'll set them free; Through cancer and disease, I'll take with me whom I please; No need to run, you can fight and face defeat, Through religion and deceit; And science and conceit, Try to stop me, but in the end I can't be beat; I'll be at it once again, You'll all face me in the end; It should be fun, as I swat you down like flies; So when it's time for you to go, Don't you cry, 'cause don't you know; It's a point at once for every man to die; So what happens when you're dead?; Ain't my problem but I've read, You'll burn in Hell, for all eternity; Life wasn't all that great, But please make no mistake; It gets much worse, after you've met me;"),
    Progression.create(progression_template: progression_template_3, tag: "Pre-Chorus 1", lyrics: "I'm the reason your sick ones pray to God as they lie there still; I'm the reason they cry out, because I kill; The different sources I may use...;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "And everybody knows my name; Everybody knows my name; Everybody plays my game;"),
    Progression.create(progression_template: progression_template_5, tag: "Chorus 1", lyrics: "And everybody knows my name;"),
    Progression.create(progression_template: progression_template_6, tag: "Outro", lyrics: "[Instr. x1]; As I close my eyes to die, I will not fear, I will not cry; As I travel down this road, I gave my all, I took my load; As I lay my head to rest, Oh God, you know! I did my best!; Was it you, or I who turned?; Whose fault is it, That I must burn; Whose fault is it?; Whose fault is it?; That I must burn;"),
]

# I am the living dead - harley poe

song = Song.find_by_name("I Am the Living Dead")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 8),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse pt 1", reps: 6)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse pt 2")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Bridge pt 1")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Bridge pt 2")
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Wake up look around everybody's dead living in this town; But we're bright and young and we don't care; ‘Cause we know that we're gonna get out of here; It's their fate their luck it's where they belong; They drag themselves around with the same old song; Who'd-have-thought they'd get a bite out of me; Fuckin' up the cards and my destiny;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 1", lyrics: "I always thought I was different from the bunch; Now all I can think about is eating you for lunch;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "I am the living dead a single thought floating in my head; I got a hunger growing deep inside it's alive it's alive;"),
    Progression.create(progression_template: progression_template_1, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Now I know it could be worse but is a zomibified humanity really a curse?; No fear I'm already dead never have to worry about who's in my bed; Or friends a job it's all obsolete the only thing that matters is what I will eat; Blood brains the Holy Grail I got my eye and it's focused and I'm not gonna fail;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "I always thought I was special but I'm not; I'm nothing but another piece of meat making up the lot;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "I am the living dead a single thought floating in my head; I got a hunger growing deep inside it's alive it's alive;"),
    Progression.create(progression_template: progression_template_5, tag: "Bridge", lyrics: "There was a time I was alive but now gone are the good old days;"),
    Progression.create(progression_template: progression_template_6, tag: "Bridge", lyrics: "I had my dreams but so it seems that living was just a faze;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 3", lyrics: "I am the living dead; I am the living dead; I am the living dead; I am the living dead, a single thought floating in my head; I got a hunger growing deep inside it's alive it's alive;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 4", lyrics: "I am the living dead a single thought floating in my head; I got a hunger growing deep inside it's alive it's alive;"),
]

# ouija - harley poe
song = Song.find_by_name("Ouija")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse pt 1", reps: 4)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse pt 2")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Ending")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 1, duration: 1),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Gonna play a show at a house tonight; Gonna turn up the tunes gonna turn down the lights; Kids lookin' ripe and lookin' good; Who's to say I wouldn't only if I could?; I feel I missed my road when I said no; But you can't have it all that's how things go; So I'll just play my guitar and when I'm through; I'll sit all by myself thinking of you;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "After awhile getting high in the bathroom gets old; Drinking too much well it's making my face look oh so old;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Now let's do something different now that we're all here; Nothing wrong with dancing and drinking beer; But I'm without my Lord so I brought my board; Place your hands on the Ouija in one accord; Friend are you near? Friend can you hear?; Enter our lives you have nothing to fear; How did you die? Possess me and cry; Do as you will but don't you lie;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "Can't you see can't you see can't you see I'm in pain?; Give me some truth to the other side, At least tell me your name;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Bridge", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Bridge", lyrics: "If you were evil then do evil (then I'll do evil); If you were good did you regret it?; Were you successful? Were you clever?; When you wanted it did you get it?; Well here's your chance do it again; Do it through me but it's still your sin; I want to taste it no consequences; We'll give each other our second chances; Do what you want, do what you want, do what you want, do what you want;", reps: 4),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Bridge", lyrics: "If you were evil then do evil (then I'll do evil); If you were good did you regret it?; Were you successful? Were you clever?; When you wanted it did you get it?; Well here's your chance do it again; Do it through me but it's still your sin; I want to taste it no consequences; We'll give each other our second chances; Do what you want, do what you want, do what you want, do what you want;", reps: 4),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Outro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Outro", lyrics: " Gonna play a show, at a house tonight; Gonna turn up the tunes gonna turn down the lights; Kids lookin' ripe and lookin' good; Who's to say I won't ‘cause I know I could?"),
]

# church hymn from the condemned - johnny hobo & the freight trains
song = Song.find_by_name("Church Hymn for the Condemned")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Life's like the feeling when you had a point, but forgot it; Had a ticket for my train of thought, but I lost it; And God gave me instructions for how to live my life; But I couldn't read his handwriting, So I burnt them last night;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "But I'd take the beauty of chaos over ugly perfection; I've woken up on the wrong side of the bed every day since 1987; I can feel myself slipping away from any chance of redemption; But that's OK cause if that's where Falwell goes; Then I don't even want any part of heaven;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "A guy on TV offered to save my soul toll-free; But that would've required getting up off of the couch so I was too lazy; Instead I wait in the bushes outside of a cop's house, holding a twelve gauge; God isn't dead, but I'll get that bastard some day!;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "And I'd take the beauty of my chaos over anyone else's perfection; I've still woken up on the wrong side of the bed every day since 1987; Nothing scares me as much as the fact that I don't give a shit for redemption; But that's OK, because if that's where Limbaugh goes, I don't even want any part of heaven;"),
    Progression.create(progression_template: progression_template_3, tag: "Outro", lyrics: ""),
]

# shadow of the day - linkin park
song = Song.find_by_name("Shadow of the Day")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 8),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Break", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "I close both locks below the window; I close both blinds and turn away; Sometimes solutions aren't so simple; Sometimes goodbye's the only way", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "And the sun will set for you; The sun will set for you; And the shadow of the day; Will embrace the world in grey; And the sun will set for you;"),
    Progression.create(progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "In cards and flowers on your window; Your friends all plead for you to stay; Sometimes beginnings aren't so simple; Sometimes goodbye's the only way;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "And the sun will set for you; The sun will set for you; And the shadow of the day; Will embrace the world in grey; And the sun will set for you;"),
    Progression.create(progression_template: progression_template_1, tag: "Break 2", lyrics: ""),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 3", lyrics: "And the sun will set for you; The sun will set for you; And the shadow of the day; Will embrace the world in grey; And the sun will set for you;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 4", lyrics: "[Instr. x2]; And the shadow of the day; Will embrace the world in grey; And the sun will set for you;"),
]

# I'm going home - Pat the Bunny
song = Song.find_by_name("I'm Going Home")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse.1")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse.2")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse.3")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 8),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "I was stupid enough to throw my life away on music; Like it was that simple; But if singing changed anything; They'd make it illegal;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "I hate strangers, loud noises, and crowds; I'll play a show every night;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Verse 1", lyrics: "And would you, and would you believe; There are people who come to me for advice?;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 1", lyrics: "I'm driving fast as the car can go; Because I'm going home;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "I was desperate enough for the feeling; Of pushing back to jump into the streets; The cops have us all surrounded; Hear them gnashing their teeth;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "Ready now, bail down the alley when we hit the next light;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Verse 2", lyrics: "And would you, and would you believe; There are people who ask me how to fight?;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 2", lyrics: "I'm running fast as these legs can go; And I'm going home;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "Five years ago, I was broken enough to just shut the fuck up; I got sober by going to rehab; And not arguing so much for once;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Punk rockers ask me how I did it; Hoping for an easier way;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Verse 3", lyrics: "And would you, and would you believe; That they don't like what I have to say?;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 3", lyrics: "I pray as much as an atheist can; And then I walk home; I'm driving fast as the car can go; Because I'm going home;", reps: 2),
]

# fear not - railyard ghosts
song = Song.find_by_name("Fear Not")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Dear brothers listen close to me; Listen to what I must impart; A tale of human history and of the human heart; If you wallow in your miseries; You'll never know the mystery; Of your own true ecstasy; You must learn to leave the dark;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Let go of all your worries; Let go of all of your fears; Watch this sickness sink into the sea; Illumined humans bound by ego; Watch it burn with purity; Ignite the inner light that's yours"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "So come out of the shadowlands; For we are are a band of brothers; And we must unite together; If ever we shall win this planet back from tyranny; It all depends on you and me; To stand and declare freedom; In the face of all that's mad;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "So say what you mean to see; And understand the power of your word; Rise up to shape reality; Be the seed that plants the life into the world; For you are a walking angel; But you just don't know it yet; So take a look deep inside yourself; To the light stored within your cells; Be brave enough to save your soul and live without regret;"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Let go of all your worries; Let go of all of your fears; Watch this sickness sink into the sea; Illumined humans bound by ego; Watch it burn with purity; Ignite the inner light that's yours;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 4", lyrics: "Howl at the moon; Take flight on the wings of a bird; Be strong and study as the mountains; And always see the power of your word;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: "May the word be on your lips; May the road be at your feet; May the life you live be free; May the road rise up to meet you; May all your stars align; May you come to know the earth; May your God be the divine; Let go of all your worries; Let go of all of your fears; Let go of all your worries; Let go of all of your fears; Let go of all your worries; Let go of all of your fears;", reps: 2),
]

# more about alcoholism - ramshackle glory
song = Song.find_by_id(75)
progression_template_1 = ProgressionTemplate.create(tag: "Intro" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 6, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
Progression.create(song_id: 75, sequence: nil, reps: 3, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Intro" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 75, sequence: nil, reps: 3, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Intro" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 75, sequence: nil, reps: 3, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Post-Chorus 1" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Outro" ,song: song, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(tag: "Verse" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 2, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "This car is a war machine that runs on nicotine and gasoline; D-d-d-don't you fucking know this is the wrong side of the road?;" ,tag: "Verse 1" ,song: song, progression_template: progression_template_2)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "I swear on my last cigarette that I'd love you my d-d-darling. I'd love you if I could;" ,tag: "Verse 2" ,song: song, progression_template: progression_template_2)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "But since the day I was born, it's been too late for me to be anything but what I am tonight;" ,tag: "Verse 2" ,song: song, progression_template: progression_template_2)
progression_template_3 = ProgressionTemplate.create(tag: "Verse Pt2" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 2, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 7, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 8, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Who needs brakes when it's all downhill from here?; And if we ain't died yet then, just maybe we never will;" ,tag: "Verse 1" ,song: song, progression_template: progression_template_3)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "And what I am is drunk, and what I am is mean, in your passenger seat!; Seat belts are for people who have time to die; hell, I don't even have time to sleep;" ,tag: "Verse 2" ,song: song, progression_template: progression_template_3)
progression_template_4 = ProgressionTemplate.create(tag: "Chorus" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 2, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "But I don't wanna burn out, so won't you please set me on fire again?; I woke up afraid of losing everything thank God that I already have; So if you love me then listen: mind your own fucking business!; If you love me enough to stay, then please love me enough to stay; enough to stay away;" ,tag: "Chorus 1" ,song: song, progression_template: progression_template_4)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Because I don't wanna miss a moment of loathing everything that I see; I stay up nights afraid of everything, till all that's left is the shadows and me; Ask me from sunrise to sunset: no, I ain't left the house yet; I finally love you enough to stay; enough to stay away;" ,tag: "Chorus 2" ,song: song, progression_template: progression_template_4)
progression_template_5 = ProgressionTemplate.create(tag: "Bridge pt1" ,reps: 3, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 1, degree: 2, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Bridge" ,song: song, progression_template: progression_template_5)
progression_template_6 = ProgressionTemplate.create(tag: "Bridge pt2" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
ProgressionChord.create(chord_id: 1, degree: 2, modifier: 1, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Bridge" ,song: song, progression_template: progression_template_6)
progression_template_7 = ProgressionTemplate.create(tag: "Ending" ,reps: 4, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_7)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_7)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_7)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_7)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Aw, shit, I wish I had a job to quit; I wish I had a boss that I could tell to fuck off; Give me the satisfaction of a dramatic exit; And not just a long car ride and a short goodbye in a parking lot (Oh oh oh);" ,tag: "Ending" ,song: song, progression_template: progression_template_7)
progression_template_8 = ProgressionTemplate.create(tag: "Intro pt2" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 6, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_8)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_8)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Intro" ,song: song, progression_template: progression_template_8)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Intro" ,song: song, progression_template: progression_template_8)
Progression.create(song_id: 75, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Post-Chorus 1" ,song: song, progression_template: progression_template_8)


# never coming home - ramshackle glory
song = Song.find_by_name("Never Coming Home")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Break")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Outro", reps: 4)
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "The trains roll by my porch; Down here where nothing can live; I've been smoking too much because I am no exception; You knew that already, I think;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "If you want salvation; Then you ought to go see a priest; Because forgiveness from those that we hurt in this world; Never was guaranteed;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "I'm coming home, it's late again, I'm high as I've ever been; You're sitting up, you're in our bed crying for a ghost again; No room could be as dark or as empty as ours is; Because I'm at home but I'm not here, and I never am;"),
    Progression.create(progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "I wonder how many; Friends roll past my house in the night?; In boxcars they sleep with hearts stashed in their backpacks; They'll make California all right;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "A promise from me; Is just a lie I ain't told yet; So I'm ready to die, but I'm not willing to watch; You watch me die here in our bed;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "I'm lying down, I've been nodding out since I don't know when; The lights are on, you're standing up screaming at a ghost again; Darling, I'm home, hell I ain't left this house of ours in days; But I'm not here. I never am, so I just can't stay;"),
    Progression.create(progression_template: progression_template_4, tag: "Break 2", lyrics: ""),
    Progression.create(progression_template: progression_template_5, tag: "Outro", lyrics: "My darlin', I'm never comin' back from where I'm going; My darlin', I'm never comin' home; My darlin', I'm never comin' back from where I'm going; My darlin', I'm never comin' home; Never comin' home again;"),
]

# first song - ramshackle glory
song = Song.find_by_name("First Song")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "No one needs to tell me how to get get get down; But won't somebody show me how to get back up?; I thought about killin' my landlord, but he was pretty nice; Instead, I paid my rent on time as often as I could; I've been making strange friends in the desert (Yeah); They love Jesus and America too; It ain't as bad as it sounds; someday I'll explain it to you;"),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "It's not that I mind sleeping alone in the grass; It's just that I've been dreaming since, well, maybe I ain't woke up yet; But nothin's been quite the same since you shot yourself; I don't know if you believe in ghosts; I hope you'd haunt me if you were one; I've been trying not to steal from everybody I know, but so far that's impossible; But here in the desert, somehow I hope that someday it won't be that way for me; No it won't... be that way for me, anymore; "),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: ""),
]

# the big sleep - toh kay
song = Song.find_by_name("The Big Sleep")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse B")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Post-Chorus A", reps: 4)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Post-Chorus B", reps: 4)
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1, bass_degree: 7),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Why do you cry when you know how the story ends?; How can you laugh when you know that it hurts your friends?; We've all been there once, but you never left; This is me coming back to get you out to say goodbye, to make amends; I'm not leaving this place; Unless I'm leaving with you;", reps: 3),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "'Cause you're the only person with a half decent heart here; And I know you will put it to use;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Until it's gone, gone, gone; Gone, gone, gone; Gone, gone, gone, gone, gone, yeah;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: " Na, na, na...; And as you close your eyes for the big sleep; I hope you think of me, yeah; Na, na, na..."),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 1", lyrics: "And if you go, I'll be gone; And you'll be left alone to live your life, as you please; But someday you'll agree that I was always meant for you; You were always meant for me and you will see...;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Post-Chorus 1", lyrics: "That you're impossible; Oh no no no no you're impossible (x3);"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Me and Mr. Dylan on the ride home; We had a heart-to-heart about life;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "But neither him or me could decide for ourselves if we wanted to outlive that night;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Like two children on the playground of the unconfessed souls; Abandoned by our mothers and our lovers and our foes;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "If only we were brave enough to live the lives we stole; What a wonderful world this could be!;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: " Na, na, na...; And as you close your eyes for the big sleep; I hope you think of me, yeah; Na, na, na..."),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 2", lyrics: "And if you go, I'll be gone; And you'll be left alone to live your life, as you please; But someday you'll agree that I was always meant for you; You were always meant for me and you will see...;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Post-Chorus 2", lyrics: "That you're impossible; Oh no no no no you're impossible (x3);"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Break 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "So, how many more examples until we break?; So how many sacrifices must we make?; "),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Because we've all been there once before; And it looks like we've returned once more; So is this the beginning or the end?;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "The last two soldiers on the battlefield; Survivors of the war; They aim at one another while their mothers beg the lord;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "If you're listening, I'm missing him; So somehow bring him home.; How did it come to this?"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "So the soldiers lift their rifles; And they're aiming at the head; They think of their first love before they take their final breaths;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "And somewhere in the distance they hear something someone said...; \"How did it come to this?\""),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 3", lyrics: " Na, na, na...; And as you close your eyes for the big sleep; I hope you think of me, yeah; Na, na, na..."),
]

# fallacy of ruin - atrocity solution
song = Song.find_by_id(123)
progression_template_1 = ProgressionTemplate.create(tag: "Intro" ,reps: 4, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Intro" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "As we hobble on broken glass, Our wounds deeper than bone at last, A faint fickle tear of the skin, As the stones cascade from these rising winds; Hear our battle cry, Its inevitable fate where we all go to die, Drag me from the pits, Or take to hills and spread these decries;" ,tag: "Verse 1" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Feel my heart, Palpitate endlessly, These tattered limbs, Quiver under their remedies; Abandon all reason, And take to these fallacies, We shan't be imprisoned, By your immorality;" ,tag: "Verse 2" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Break" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 4, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Buildup" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "We are the fallen, Bound by chains, We are the fallen, Guided by winds to; We are the fallen, Bound by chains, We are the fallen, It will be too late;" ,tag: "Chorus 3" ,song: song, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(tag: "Chorus" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 7, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "We are the fallen, Bound by chains, Guided by winds to; These vast desolate lands, That blind our ways, Strangle our fate;" ,tag: "Chorus 1" ,song: song, progression_template: progression_template_2)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "We are the fallen, Bound by chains, Guided by winds to; These vast desolate lands, That blind our ways, Strangle our fate;" ,tag: "Chorus 2" ,song: song, progression_template: progression_template_2)
progression_template_3 = ProgressionTemplate.create(tag: "Break" ,reps: 10, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Break" ,song: song, progression_template: progression_template_3)
progression_template_4 = ProgressionTemplate.create(tag: "Hang" ,reps: 4, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Breakdown" ,song: song, progression_template: progression_template_4)
progression_template_5 = ProgressionTemplate.create(tag: "Bridge" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 2, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_5)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Breakdown" ,song: song, progression_template: progression_template_5)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "This is the end, the end of days, Broke like a dog, forced to praise, Erase our lives, when will your god arise; Beckoned and bleak, forfeit the weak, Trampled by all, all their decree, How long must we abide, Only the strong will survive;" ,tag: "Bridge" ,song: song, progression_template: progression_template_5)
progression_template_6 = ProgressionTemplate.create(tag: "Bridge Pt2" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
ProgressionChord.create(chord_id: 1, degree: 7, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_6)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Escape and spread this tale of atrocities, Before its too late, disband this final resting place; How long must we suffer, Shackled and shamed by this mandate, The fallen are under and no solution will be made;" ,tag: "Bridge Pt2" ,song: song, progression_template: progression_template_6)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Bridge Pt2" ,song: song, progression_template: progression_template_6)
progression_template_7 = ProgressionTemplate.create(tag: "Break 2" ,reps: 1, key_id: nil, scale_id: nil, song: song)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Pause" ,song: song, progression_template: progression_template_7)
progression_template_8 = ProgressionTemplate.create(tag: "Intro Riff Variation" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_8)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_8)
ProgressionChord.create(chord_id: 1, degree: 7, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_8)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "It will be too late" ,tag: "Chorus 3" ,song: song, progression_template: progression_template_8)
progression_template_9 = ProgressionTemplate.create(tag: "Ending" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
ProgressionChord.create(chord_id: 1, degree: 7, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 7, staccato: "false" ,muted: "false" ,progression_template: progression_template_9)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Feel my heart, Palpitate endlessly, Tattered limbs, Quiver under their remedies; Abandon all reason, And take to these fallacies, We shan't be imprisoned, By your immorality; By your immorality;" ,tag: "Verse 3" ,song: song, progression_template: progression_template_9)
Progression.create(song_id: 123, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "" ,tag: "Ending" ,song: song, progression_template: progression_template_9)

# where no one goes - we the heathens
song = Song.find(110)
progression_template_1 = ProgressionTemplate.create(tag: "Intro" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(tag: "Verse" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
progression_template_3 = ProgressionTemplate.create(tag: "Verse Pt1" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 2, degree: 2, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 7, staccato: "false" ,muted: "false" ,progression_template: progression_template_3)
progression_template_4 = ProgressionTemplate.create(tag: "Verse Pt2A" ,reps: 1, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 4, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 2, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 3, sequence: 7, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)
ProgressionChord.create(chord_id: 1, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 8, staccato: "false" ,muted: "false" ,progression_template: progression_template_4)

# same in the end - sublime
song = Song.find_by_id(101)
progression_template_1 = ProgressionTemplate.create(tag: "Verse" ,reps: 4, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 4, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_1)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Down in Mississippi where the sun beats down from the sky; They give it up and they give it up and they give it up but they never ask why; Daddy was a rollin' rollin' stone; He rolled away one day and he never came home;" ,tag: "Verse 1" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "You only see what you want to believe; When you light up in the back with those tricks up your sleeve; That don't mean I can't hang but the day that I die; Will be the day that I shut my mouth and put down my guitar; Sunday morning hold church down at the bar; Get down on your knees and start to pray; Pray my itchy rash will go away; " ,tag: "Verse 2" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "I only hear what you told me to be, I'm a backward-ass hillbilly, I'm Dick Butkiss; You know I lie, I get mean, I'm a thief in the dark, I'm a ragin' machine; I'm a triple rectified ass son of a bitch; Rec-tite(tm) on my ass and it makes me itch; I can see for miles and miles and miles; My broken heart makes me smile;" ,tag: "Verse 3" ,song: song, progression_template: progression_template_1)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "You only see what you want to believe; When you creep from the back I got tricks up my sleeve; 24/7 the devil's best friend, it makes no difference it's all the same in the end;" ,tag: "Verse 4" ,song: song, progression_template: progression_template_1)
progression_template_2 = ProgressionTemplate.create(tag: "Chorus" ,reps: 2, key_id: nil, scale_id: nil, song: song)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 1, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 7, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 2, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 3, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 1, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 4, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 6, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 5, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 1, degree: 3, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 1, sequence: 6, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
ProgressionChord.create(chord_id: 2, degree: 5, modifier: 0, bass_degree: nil, bass_modifier: 0, duration: 2, sequence: 7, staccato: "false" ,muted: "false" ,progression_template: progression_template_2)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: " It ain't hard to understand, this ain't Hitler's master plan; What it takes to be a man; In my mind, in my brain, I roll it over like a steamin' freight train; It ain't hard to ascertain;" ,tag: "Chorus 1" ,song: song, progression_template: progression_template_2)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "Back up y'all it ain't me, Kentucky Fried Chicken is all I see; It's a hellified way to start your day; If I make you cry all night, me and daddy gonna have a fist fight; It ain't personal, it ain't me;" ,tag: "Chorus 2" ,song: song, progression_template: progression_template_2)
Progression.create(song_id: 101, sequence: nil, reps: 1, key_id: nil, scale_id: nil, lyrics: "In my mind, in my brain, I go back and go completely insane; It ain't personal, it ain't me; If I make you cry I might, be your daddy at the end of the night; Take a load from my big gun;" ,tag: "Chorus 3" ,song: song, progression_template: progression_template_2)

# house of the rising sun - the animals
song = Song.find_by_name("House of the Rising Sun")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "There is a house in New Orleans, they call the Rising Sun; And it's been the ruin of many a poor boy and God, I know I'm one;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "My mother was a tailor, she sewed my new blue jeans; My father was a gamblin' man, down in New Orleans;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Now the only thing a gambler needs, is a suitcase and a trunk; And the only time he's satisfied is when he's on a drunk;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 3", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Solo", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 4", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 4", lyrics: "Oh mother, tell your children, not to do what I have done; Spend your lives in sin and misery, in the House of the Rising Sun;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 5", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 5", lyrics: "Well, I got one foot on the platform, the other foot on the train; I'm goin' back to New Orleans to wear that ball and chain;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 6", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 6", lyrics: "Well, there is a house in New Orleans, they call the Rising Sun; And it's been the ruin of many a poor boy, and God, I know I'm one;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Outro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Outro", lyrics: ""),
]

# fallohides - we the heathens
song = Song.find_by_name("Fallohides")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Post-Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Break", reps: 2)
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Bridge A", reps: 4)
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

progression_template_7 = ProgressionTemplate.create(song: song, tag: "Bridge B")
progression_template_7.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
]

progression_template_8 = ProgressionTemplate.create(song: song, tag: "Breakdown")
progression_template_8.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 8),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_9 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_9.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Sticks and stones of forests deep, Our home away from home, Runaway rivers, never-ending streams, Bonfires and darkened tomes; Hear our song, our haunting cries, Dead leaves and scattered ash, Forever under blackened skies, Our home, our first and last;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Don't stand still, your gaze will turn a stone, Nomadic panoramic view will show you where to go; Don't stand still, your gaze will turn a stone, Restless feet, incredulously create a brand new home;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 1", lyrics: "[Verify Chords]"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "Strip us of our feeble lives, Domesticated slaves; Dormant thoughts, unfathomed dreams; All caged eternally; Hear our song, our haunting cries, Dead leaves and scattered ash; Bending 'til we break the night, Our home we'll find at last;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Don't stand still, your gaze will turn a stone, Nomadic panoramic view will show you where to go; Don't stand still, your gaze will turn a stone, Restless feet, incredulously create a brand new home;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Bridge", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_6, tag: "Bridge", lyrics: "I embody all the flies, Inherit all the sky, Relinquish all the ties to the roots of my; Filthy tattered feet, My weakened bloody knees, My deathly shadowed dreams that stay hidden in the trees;"),
    Progression.create(song: song, progression_template: progression_template_7, tag: "Bridge", lyrics: "Condemn my sullen life, Dismember all the strife, Escape this troubled mind that stays locked inside; Scrambling for the keys, Clutching any pleas, Pick up these two feet and run for the trees;"),
    Progression.create(song: song, progression_template: progression_template_8, tag: "Breakdown", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Sticks and stones of forests deep, Our home away from home, Runaway rivers, never-ending streams, Bonfires and darkened tomes; Hear our song, our haunting cries, Dead leaves and scattered ash, Forever under blackened skies, Our home, our first and last;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 3", lyrics: "Don't stand still, your gaze will turn a stone, Nomadic panoramic view will show you where to go; Don't stand still, your gaze will turn a stone, Restless feet, incredulously create a brand new home;"),
    Progression.create(song: song, progression_template: progression_template_9, tag: "Outro", lyrics: ""),
]

# seven nation army - white stripes
song = Song.find_by_name("Seven Nation Army")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "I'm gonna fight 'em off, A seven nation army couldn't hold me back; They're gonna rip it off, Taking their time right behind my back; And I'm talkin' to myself at night because I can't forget; Back and forth through my mind behind a cigarette;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "And the message comin' from my eyes says, \"Leave it alone\";", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: " Don't wanna hear about it, Every single one's got a story to tell; Everyone knows about it, From the Queen of England to the hounds of hell; And if I catch it comin' back my way, I'm gonna serve it to you; And that ain't what you want to hear, But that's what I'll do;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "And the feeling coming from my bones says, \"Find a home\";", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Post-Chorus 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "I'm going to Wichita, Far from this opera for evermore; I'm gonna work the straw, Make the sweat drip out of every pore; And I'm bleeding, and I'm bleeding, and I'm bleeding right before the Lord; All the words are gonna bleed from me and I will think no more;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 3", lyrics: "And the stains comin' from my blood tell me, \"Go back home\";", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Outro", lyrics: ""),
]

# hell and you - amigo the devil
song = Song.find_by_name("Hell And You")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Verse B", reps: 2)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Went to the bar to get a little closer to myself and learn; Things I never really wanted to know; The walk got a little far, so I got into a cab that smelled like vinegar; Stains that showed what's in the girl before;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pre-Chorus 1", lyrics: "But I want to be where all the stupid things I say sound so romantic and true;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Cause I'd rot in hell with you if you'd just ask me to; I love the shitty things we do together, live with me in this sin forever; Hell, and you, I know you want it too; I say, take the shot, see this chance, feel the fire and let me have this dance with you;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Verse 2", lyrics: "We take things a little far but you couldn't name a place I wouldn't go with you; A plane, a train, a car, I'd run, If I was dead I'd float; I'd crawl in bed with you, even on someone else's blood; On top of someone else's love, in the worst motel we find;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pre-Chorus 2", lyrics: "Cause home is the last place, that I'd stand to be with anyone but you;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Cause I'd rot in hell with you if you'd just ask me to; I love the shitty things we do together, live with me in this sin forever; Hell, and you, I know you want it too; I say, take the shot, see this chance, feel the fire and let me have this dance with you;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Break", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 3", lyrics: "Cause I'd rot in hell with you if you'd just ask me to; I love the shitty things we do together, live with me in this sin forever; Hell, and you, I know you want it too; I say, take the shot, see this chance, feel the fire and let me have this dance with you;"),
]

# booger storm - walter mitty makeshift orchestra
song = Song.find_by_name("Booger Storm")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Out of tune these days, the only truth I hear is slang; My ceiling is your ground, everything's turned around, So now God thinks it's me who doesn't actually exist; I walked my better half to your door, left feeling worse than I had before; The sex was borning, my morning breath came out to say I'm jaded and I've lost my carpe diem;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Cause now everything feels so hollow, swordfight my drunken mouth 'till I fall face down in the furniture; Never believe me, I'm just a dunce, I'm still twenty grand and sixty units from enlightenment;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "O cellphone, laptop, o dirty dishes what have I become; We're playing chicken with cancer, getting white lies for answers from the trash culture shoved in our face; Now that the internet's down we can do something else, turn our angst into products to sell somewhere; I guess that's why we're here, I shouldn't tell you this, this could get dangerous;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Now everything feels so hollow, sit in the shower now, drain the hot water and anxiety; I've got this stale feeling questioning everything, if it's all kitchy what does that make me?;", reps: 2),
]

# chamomile - walter mitty makeshift orchestra

song = Song.find_by_name("Chamomile")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major_seventh, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse Ending")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Long as it's as it's raining, you might as well stay, sit on the carpet, sippin' on chamomile, tell me your day;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "I know it's hard but, at least try to explain, you woke up feeling older, disenchanted with the music you play;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Catastrophically older, numb to the magic of holidays;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Bridge", lyrics: "Well I'll tell you I woke up euphoric, barely retaining the Unified Theory of Basically Everything; Wandered all day, with no one to tell, I'm afraid if I sleep that I might not remember it; It'll send me back over the falls; But what with the heartbreak and healing I can't say it's anyone's fault;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Oh well I know you're tired, and losing your faith, one last quest to find love, prove to us all it's still worth the wait;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Sit by bodies of water and confide in the rain, I used to be scared, begging for answers or truths I could hold;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "But trust me, it's moments like this that remind me there's no need to know;"),
]

# gorehound - harley poe

song = Song.find_by_name("Gorehound")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Post-Chorus", reps: 2)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "She's always asking why I like watching people die, and why I get my kicks while others scream and cry; And my friends think that I'm sick or maybe uneducated, and my family doesn't want to admit that they are related; Now monsters and madmen who rape and mutilate are perfect entertainment when I take her on a date; You can shove your sparkly vampires and family comedies, give me blood and beasts and boobs them sacred triple Bs;", reps: 4),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pre-Chorus 1", lyrics: "Don't ask me why, 'cause I don't know, don't close your eyes, enjoy the show;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "'Cause I'm a gorehound, hellbound horror movie lover, I like my voyerism with a glass of red rum; 'Cause I'm a gorehound, hellbound, horror movie lover, good and evil are just colors on the spectrum;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Post-Chorus 1", lyrics: "One, two, three, four, nail her to the bedroom flour; Five, six, seven, eight, rape and kill and mutilate;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Now who could kill a child? Whoever slew Auntie Roo? Someone's knocking at the door and they're here to visit you; Now baby don't look now but I'm sure there's nothing out there, but horror rises from the tomb and traps you in your nightmare; Now girlfriend come with me to a land of make believe, or is it based on facts it turns me on when I should grieve; You say my head is fucked, with a dark and twisted heart, well I say that it's cathartic just another form of art;", reps: 4),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pre-Chorus 2", lyrics: "Don't ask me why, 'cause I don't know, don't close your eyes, enjoy the show;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "'Cause I'm a gorehound, hellbound horror movie lover, I like my voyerism with a glass of red rum; 'Cause I'm a gorehound, hellbound, horror movie lover, good and evil are just colors on the spectrum;", reps: 2),
]

# old kentucky breakdown - broken bow

song = Song.find_by_name("Old Kentucky Breakdown")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Well I drink down the whiskey let the smoke bite my lungs with a ratchet in my soul and from their fingers and their tongues; We will never stick together with a wrench inside my heart we're behind where we were, we were from the start; And I will never understand why they long to use those hands with a clock ticking forward pointing to the promised lands; A ticker tape parade, a forty piece band, the stocks they might crash but the weak they still stand;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Pre-Chorus 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 1", lyrics: "And here's farewell, to old Kentucky, it's farewell to old Colorado; I'm going where the wind ain't blowing I'm goin gwhere that old north wind don't blow;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Pre-Verse 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "So I jump into the well just to spite the water, now the whiskey is poisoned, we should've fought harder; But my hindsight is blind, my foresight is blurry, I hope the four horsemen come on down with all of heaven's fury; ... ... But that apathy slowly seeps into my heart we're behind where we were, where we were from the start;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Pre-Chorus 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 2", lyrics: "And here's farewell, to old Kentucky, it's farewell to old Colorado; I'm going where the wind ain't blowing I'm goin gwhere that old north wind don't blow;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Pre-Verse 3", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "So now I wonder 'round the country with my pockets full of sand, I'll tear down the wall when I'm dealt the right hand; But united we fall, divided we stand, she can't tell the difference between her friends and her fans; But lady liberty, is waving a white flag so put all of your belongings in a black plastic trash bag; And walk into the sunset, fall off the edge of the Earth;", reps: 2),
]

song = Song.find_by_name("Forty Days")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse p1")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse p2", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, staccato: true),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "And it's been forty days, I've tried forty ways; You will never quite leave your sins behind; They'll haunt you, taunt you until the day you die; You will never really go; You'll just think about it much but you'll need to know how the story ends; so you'll sit around, even though you should just go; Tell your friends what you have heard, show them all the lies unlearned; And when you really go, you will really know you were never meant for earth;", reps: 12),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Verse 1", lyrics: "What's it worth?; If we're going to break it down with any logic, it's absurd; Na na na na..."),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 1", lyrics: "And no matter where we go, we are not alone; When the silence turns to cries of \"Why?\"; What a way to begin: we inherit sin; And nobody's going to quench your thirst when the well runs dry; And nobody's going to hold your hand on the day you die;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "I've tasted seven sins, so they won't let me in; I knock knock knock until my knuckles are bruised and raw; Stuck in the middle with my blood in a puddle on the floor; We made our beds, we'll judge ourselves; And only then and there will we disappear to our final resting place;", reps: 8),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Verse 2", lyrics: "What a waste!; So many decent people at the gates;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 2", lyrics: "And no matter where we go, we are not alone; When the silence turns to cries of \"Why?\"; What a way to begin: we inherit sin; And nobody's going to quench your thirst when the well runs dry; And nobody's going to hold your hand on the day you die;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 3", lyrics: "And no matter who you know, you will be alone; When the silence turns to cries of \"Why?\"; What a way to begin: we inherit sin; And nobody's going to quench your thirst when the well runs dry; And nobody's going to hold your hand on the day you die;"),
]

# toxicity - system of a down

song = Song.find_by(name: "Toxicity")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]
progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Post-Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
]

song.progressions = [

    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Intro", lyrics: "", reps: 4),
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Conversion, software version 7.0; Looking at life through the eyes of a tire hub; Eating seeds as a pastime activity; The toxicity of our city, of our city;", reps: 4),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "New, what do you own the world; How do you own disorder, disorder; Now, somewhere between the sacred silence; sacred silence and sleep; Somewhere between the sacred silence and sleep; Disorder, disorder, disorder;", reps: 4),
    Progression.create(progression_template: progression_template_1, tag: "Pre-Verse 2", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "More wood for their fires, loud neighbours; Flashlight reveries caught in the headlights of a truck; Eating seeds as a pastime activity; The toxicity of our city, of our city;", reps: 4),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: " New, what do you own the world, How do you own disorder, disorder; Now, somewhere between the sacred silence, sacred silence and sleep; Somewhere between the sacred silence and sleep, Disorder, disorder, disorder;", reps: 4),
    Progression.create(progression_template: progression_template_3, tag: "Breakdown", lyrics: "", reps: 16),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "New, what do you own the world, How do you own disorder; Now, somewhere between the sacred silence, sacred silence and sleep; Somewhere between the sacred silence and sleep, Disorder, disorder, disorder; ", reps: 4),
    Progression.create(progression_template: progression_template_3, tag: "Ending", lyrics: "", reps: 4),
    Progression.create(progression_template: progression_template_3, tag: "Ending", lyrics: "When I became the sun, I shone life into the man's hearts, When I became the sun, I shone life into the man's hearts", reps: 4),
]

# cricket
song = Song.find_by_name("Cricket")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Post-Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "I never thought about it before, just close your eyes and ignore the dark that troubles you most, don't let it be here;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "And if you see it again, hold your breath and pretend, that you're already dead, you won't be here;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 1", lyrics: "I will always hold your hand I'll never let you fall, because nothing, nothing else matters at all; if you're scared just think of me, cause you know I'd never let you be anywhere but with me;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Post-Chorus 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Forget the story you heard, why're you worried about the dirt, I don't think that you'll mind when it's your time;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "'Cause I will be there with you, and we'll figure out what to do so that you don't get bored, you'll never be alone;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 2", lyrics: "I will always hold your hand I'll never let you fall, because nothing, nothing else matters at all; if you're scared just think of me, cause you know I'd never let you be anywhere but with me;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Post-Chorus 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "So try to sleep with a smile, promise I'll wait a while to make sure that you've moved on, you won't be lost;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 3", lyrics: "I will always hold your hand I'll never let you fall, because nothing, nothing else matters at all; if you're scared just think of me, cause you know I'd never let you be anywhere but with me;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Post-Chorus 3", lyrics: ""),
]
# ya no sos igual - 2 minutos
song = Song.find_by_name("Ya no sos igual")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse B")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus A", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus B")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 3),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "Carlos se vendio, al barrio de Lanuz; El barrio que le vió crecer; Ya no vino nunca mas por el barrio de Fabían; y se olvidó de pelearse los domingos en la cancha; Por la noche, patrulla la ciudad; Molestando y levantando a los demas;", reps: 3),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 1", lyrics: "Ya no sos igual, ya no sos igual; Sos un vigilante de la federal;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Sos buchón, sos buchón (bis);"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Break", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "Carlo se dejó, crecer el bigote tiene una nueve para el; ya no vino nunca mas por el barrio de Fabián; y se olvido de pelearse los domingos en la cancha; El sabe muy bien que una bala en la noche en la calle espera por el;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 2", lyrics: "Ya no sos igual, ya no sos igual; Sos un vigilante de la federal;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 2", lyrics: "Sos buchón, sos buchón (bis);"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Bridge", lyrics: "Oh, sos buchón, de la policía federal;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Bridge", lyrics: "Oh, sos buchón, de la policía federal;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 3", lyrics: "Ya no sos igual, ya no sos igual; Sos un vigilante de la federal;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 3", lyrics: "Sos buchón, sos buchón (bis);"),
]

# snowdrop - rent strike
song = Song.find_by_name("I. Snowdrop")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4, bass_degree: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse B")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4, bass_degree: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Outro")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "The river is frozen, you walk across; From snowy bank to snowy bank; But each side looks like just like the other; What difference has it ever made?; "),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "And in the evening, we watch the sun; Follow where the light, goes when it sets; Neon torches along the highway exits; To the end of every cigarette; "),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "So let the wind, go where it wants; Let the ice crack in the by and by; I won't wait around forever; This is the end, this is goodbye;"),
    Progression.create(progression_template: progression_template_3, tag: "Outro", lyrics: ""),
]

# tangled in ropes - holy locust
song = Song.find_by_name("Tangled in Ropes")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Riff 1")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "I'm tangled in ropes, Pulled into the shore; You wash up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "When the tide rolled out, And all was exposed; You found yourself drowning, in currents untold; Here's a sand dollar too, Hard thoughts taking hold; Though a hundred-degree heat he felt took hold", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Post-Chorus 1", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Well the winter came early, and the ocean froze over; You threw your belongings, onto the shoulder; Stole a pair of boots, that could handle the cold; And walked out into the frozen unknown", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Post-Chorus 2", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "Now I'm tangled in ropes, Pulled into the shore; You washed up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "When the tide rolled out, And all was exposed; You found yourself drowning, in currents untold; Here's a sand dollar too, Hard thoughts taking hold; Though a hundred-degree heat he felt took hold", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 3", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Post-Chorus 3", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "Well the winter came early, and the ocean froze over; You threw your belongings, onto the shoulder; Stole a pair of boots, that could handle the cold; And walked out into the frozen unknown", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 4", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Outro", lyrics: "I'm tangled in ropes, Pulled into the shore; You wash up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1),
]

# frijolero - molotov
song = Song.find_by_name("Frijolero")
progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus alt ending")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2)
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Yo ya estoy hasta la madre, de que me pongan sombrero; Escucha entonces cuando digo, no me llames frijolero;", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Y aunque exista algún respeto, Y no metamos las narices; Nunca inflamos la moneda, Haciendo guerra a otros países", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Te pagamos con petróleo, E intereses nuestra deuda; Mientras tanto no sabemos, ¿Quién se queda con la feria?;", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Aunque nos hagan la fama, De que somos vendedores; De la droga que sembramos, Ustedes son consumidores", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Don't call me gringo you fucking beaner; Stay on your side of that goddamn river; Don't call me gringo, you beaner", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "No me digas beaner Mr. Puñetero; Te sacaré un susto por racista y culero; No me llames frijolero pinche gringo puñetero", reps: 1),
    Progression.create(progression_template: progression_template_1, tag: "Solo", lyrics: "", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "Now I wish I had a dime for every single time; I've gotten stared down for being in the wrong side of town", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "And a rich man I'd be, If I had that kind of chips; Lately I wanna smack the smiles off these racists", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "Podrás imaginarte desde afuera ser un mexicano cruzando la frontera; Pensando en tu familia mientras que pasas dejando todo lo tú que conoces atrás", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "Si tuvieras tú que esquivar las balas de unos cuantos gringos rancheros; ¿Les seguirás diciendo good for nothing wetbacks si tuvieras tú que empezar de cero?", reps: 1),
    Progression.create(progression_template: progression_template_2, tag: "Verse 4", lyrics: "Now why don't you look down to where your feet is planted; That U.S. soil that makes you take shit for granted, If not for Santa Ana, just to let you know; That where your feet are planted would be Mexico, Correcto!", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Don't call me gringo you fucking beaner; Stay on your side of that goddamn river; Don't call me gringo, you beaner", reps: 1),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "No me digas beaner Mr. Puñetero; Te sacaré un susto por racista y culero; No me llames frijolero pinche gringo puñetero", reps: 1),
    Progression.create(progression_template: progression_template_4, tag: "Finale", lyrics: "", reps: 1),
]

# there is a time
song = Song.find_by_name("There is a time")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Ending")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 1", lyrics: "There is a time for love and laughter, the days will pass like summer storms; The winter wind will follow after, but there is love and love is warm;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Chorus 1", lyrics: "There is a time for us to wander, when time is young and so are we; The woods are greener over yonder, the path is new, the world is free;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 2", lyrics: "There is a time when leaves are fallin', the woods are gray, the paths are old; The snow will come when geese are callin', you need a fire against the cold;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Chorus 2", lyrics: "There is a time for us to wander, when time is young and so are we; The woods are greener over yonder, the path is new, the world is free;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 3", lyrics: "There is a time for love and laughter, the days will pass like summer storms; The winter wind will follow after, but there is love and love is warm;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Chorus 3", lyrics: "So do your roaming in the springtime, and you'll find your love in the summer sun; The frost will come and bring the harvest, and you can sleep when the day is done;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Verse 4", lyrics: "Time is like a river flowing, with no regrets as it moves on; Around each bend the shining morning, and all the friends we thought were gone;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Chorus 4", lyrics: "There is a time for us to wander, when time is young and so are we; The woods are greener over yonder, the path is new, the world is free;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Ending", lyrics: "The path is new , the world is free;"),
]

# este infierno - bestiario
song = Song.find_by_name("Este Infierno")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus A")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus B")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Hang")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 8),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "El mundo es asqueroso y difficil de entender, la gente que lo habita asquerosa también es; Yo yo solo me siento a ver;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Donde hubo un humano, hubo guerra y destrucción; Algún río dejó seco por la deforestación, el aire lo envenenó;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Creó para sí mismo su propia enfermedad, poniéndole a todo un valor; Cuando el dinero terminaron de acuñar, este infierno acaba de empezar;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Break 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "No contento con tener su propria lbertad; Se ha inventado los gobiernos que se la pueden quitar; Control, poder, autoridad;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "Invirtió su tiemp en invasión tras invasión; Contra si mismo aniquilación, se inventó las armas para su destrucción;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Creó para si mismo su propria enfermedad, cuando se inventó la propriedad; Cuando las fronteras terminó de dibujar, este infierno acaba de empezar;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Break 2", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Ha buscado dioses, no ha encontrado salvación; Entre tanta lucidez sólo hay mentira y confusión, esclavos de una religión;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Plagó todo el planeta cual se fuera enfermedad; Y arrasó todo dentro con su ambición voraz, por eso odio a la humanidad;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 3", lyrics: "Creó para si mismo su propria enfermedad, cuando se inventó la propiedad; Cuando las fronteras terminó de dibujar;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Chorus 3", lyrics: "Este infierno, este infierno, este infierno;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Chorus 3", lyrics: "Acaba de empezar;"),
]

# salgo a la calle
song = Song.find_by_name("Salgo a la Calle")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Bridge")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Salgo a la calle para no pensar, pocas cosas me hacen reaccionar; Porque me ahogo en esta realidad, porque me agobia la necesidad; De saber que algo va a cambiar, que no todos los días van a ser igual; No resisto esta rutina d'esta mierda de vida, necesito saber qu'algo va a explotar, algo va a explotar;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Porque tengo.. La necesidad necesito saber que algo va a cambiar; voy viviendo sin sentido, este sistema no me deja avanzar; recorriendo a día día, esa ciudad intentando escapar del camino marcado; no volveré a no pelear x4;"),
    Progression.create(progression_template: progression_template_2, tag: "Break", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Break", lyrics: "Machacados por el trabajo, Reducidos por el estado; Controladores por todos lados, defendiendo su norma socia; De esta falsia democracia x4", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: ""),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Salgo a la calle para no pensar, pocas cosas me hacen reaccionar; Porque me ahogo en esta realidad, porque me agobia la necesidad; De saber que algo va a cambiar, que no todos los días van a ser igual; No resisto esta rutina d'esta mierda de vida, necesito saber qu'algo va a explotar, algo va a explotar;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Porque tengo.. La necesidad necesito saber que algo va a cambiar; voy viviendo sin sentido, este sistema no me deja avanzar; recorriendo a día día, esa ciudad intentando escapar del camino marcado; no volveré a no pelear x4;"),
]

# plus rien - cowboys fringants
song = Song.find_by_name("Plus Rien")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 16),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse A")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse B")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Bridge", reps: 2)
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "Il ne reste que quelques minutes à ma vie, tout au plus quelques heures je sens que je faiblis; Mon frère est mort hier au milieu du désert, je suis maintenant le dernier humain de la terre;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 1", lyrics: "On m'a décris jadis quand j'étais un enfant, ce qu'avait l'air le monde il y a très très longtemps; Quand vivvaient les parents de mon arrière-grand-père, et qu'il tombait encore de la neige en hiver;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 1", lyrics: "En ces temps on vivait au rythme des saisons, et la fin des étés apportaient la moisson; Une eau pure et limpide coulait dans les ruisseaux, où venaient s'abreuver cheuvreuils et orignaux;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "Mais moi je n'ai vu qu'une planète désolante, paysages lunaires et chaleur suffocante; Et tous mes amies mourir par la soif ou la faim, comme tombent les mouchent; Jusqu'à ce qu'il n'y ait plus rien, plus rien, plus rien, ...;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Il ne reste que quelques minutes à ma vie, tout au plus quelques heures je sens que je faiblis; Mon frère est mort hier au milieu du désert, je suis maintenant le dernier humain de la terre;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "Tout ça a commencé il y a plusieurs années, alors que mes ancêtres étaient obnubilés; Par des bouts de papier que l'on appellait argent, qui rendait certains hommes vraiment riches et puissants;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "Et ces nouveaux dieux ne reculant devant rien, étaient prêts à tout pour arriver à leur fins; Pour s'enrichier encore ils ont rasé la Terre, pollué l'air ambiant et tari les rivières;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "Mais au bout de cent ans les gens se sont levés, et les ont avertis qu'il fallait tout stopper; Mais ils n'ont pas compris cette sage prophécie, ces hommes là ne parlaient qu'en termes de profits;"),
    Progression.create(progression_template: progression_template_5, tag: "Verse 2", lyrics: "C'est des années plus tard qu'ils ont vu le non-sens, dans la panique ont déclaré l'état d'urgence; Quand tous les océeans ont englouti les îles, et que les inondations ont frappé les grandes villes; Et par la suite pendant toute une décennie, ce fut les ouragans et puis les incendies; Les tremblements de terre et la grande sécheresse, partout sur les visages on lisait la détresse;"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "Les gens ont du se battre contre les pandémies, décimés par millions par d'atroces maladies; puis les autres sont morts par la soif ou la fin, comme tombent les mouches; Jusqu'à ce qu'il n'y ait plus rien, plus rien, plus rien, ...;"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 3", lyrics: "Mon frère est mort hier au milie du désert, je suis maintenant le dernier humain de la Terre; Au fond l'intelligence qu'on nous avait donné, n'aura été qu'un beau cadeau empoisonné;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 3", lyrics: "Car il ne reste que quelques minutes à ma vie, tout au plus quelques heures je sens que je faiblis; Je ne peux plus marcher j'ai mal à respirer; Adieu l'humanité, adieu, l'humanité;"),
]

# where is my mind
song = Song.find_by_name('Where is my Mind?')

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")

progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")

progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah); Your head will collapse, and there's nothing in it; And you'll ask yourself", reps: 3),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Where is my mind?; Where is my mind?", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Where is my mind?;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "Way out in the water, see it swimmin';", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "I was swimmin' in the Caribbean; Animals were hiding behind the rocks; Except the little fish; Bumped into me, I swear he was trying to talk to me, koi-koi", reps: 3),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Where is my mind?; Where is my mind?", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Where is my mind?;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "Way out in the water, see it swimmin';", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah); Your head will collapse, and there's nothing in it; And you'll ask yourself", reps: 3),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 3", lyrics: "Where is my mind?; Where is my mind?", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 3", lyrics: "Where is my mind?;", reps: 2),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "Way out in the water, see it swimmin';", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Outro", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah);", reps: 2),
]

# porque te vas

song = Song.find_by_name("Porque te vas")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")

progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")

progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Hoy en mi ventana brilla el sol; Mi corazón, se pone triste contemplando la ciudad; Por que te vas;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Como cada noche desperté; Pensando en vos, y en mi reloj todas las horas no terminan mas; Por que te vas;"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 1", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "Yo en tu vida solamente fui; Un juego mas, y todo aquello que juraste por mi amor; Lo olvidaras"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 4", lyrics: "Como cada noche desperté; Pensando en vos, y en mi reloj las horas no terminan mas; Por que te vas"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 2", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 5", lyrics: "Bajo la penumbra de un farol; Se te olvidan, todas las cosas que quedaron por decir; se te olvidan"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 6", lyrics: "Junto a las manillas de un reloj; Esperaran, todas las horas que quedaron por vivir; Esperaran"),
    Progression.create(progression_template: progression_template_2, tag: "Chorus 3", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas"),
]

# somewhere over the rainbow

song = Song.find_by_name("Somewhere over the rainbow")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro 1")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Intro 2")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, bass_degree: 3),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 2)
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_3, tag: "Verse 1", lyrics: "Somewhere over the rainbow, way up high; And the dreams that you dream, once in a lullaby"),
    Progression.create(progression_template: progression_template_3, tag: "Verse 2", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dream of, dreams really do come true. Ohhhh."),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 1", lyrics: "Someday I'll wish upon a star, wake up where the clouds are far behind me; Where troubles melts like lemon drops, high above the chimney tops; that's where you'll find me, oh "),
    Progression.create(progression_template: progression_template_3, tag: "Verse 3", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dare to, oh, why, oh why can't I? I-I-I, oh"),
    Progression.create(progression_template: progression_template_4, tag: "Chorus 2", lyrics: "Someday I'll wish upon a star, wake up where the clouds are far behind me; Where troubles melts like lemon drops, high above the chimney tops; that's where you'll find me, oh "),
    Progression.create(progression_template: progression_template_3, tag: "Verse 4", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dare to, oh, why, oh why can't I? I-I-I, oh"),
    Progression.create(progression_template: progression_template_2, tag: "Outro", lyrics: ""),
]

# california dreamin'

song = Song.find_by_name("California Dreamin'")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__double_suspended, degree: 1, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: 'Solo')
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 7),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__seventh_suspended_fourth, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__seventh_suspended_fourth, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__seventh_suspended_fourth, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Final verse")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major_seventh, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "All the leaves are brown (All the leaves are brown); And the sky is gray (And the sky is gray); I've been for a walk (I've been for a walk); On a winter's day (On a winter's day); I'd be safe and warm (I'd be safe and warm); If I was in L.A. (If I was in L.A.); California dreamin' (California dreamin'); On such a winter's day;"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Stopped in to a church; I passed along the way; Well, I got down on my knees (Got down on my knees); And I pretend to pray (I pretend to pray); You know the preacher liked the cold (Preacher liked the cold); He knows I'm gonna stay (Knows I'm gonna stay); California dreamin' (California dreamin'); On such a winter's day"),
    Progression.create(progression_template: progression_template_3, tag: "Solo", lyrics: ""),
    Progression.create(progression_template: progression_template_4, tag: "Verse 3", lyrics: "All the leaves are brown (All the leaves are brown); And the sky is gray (And the sky is gray); I've been for a walk (I've been for a walk); On a winter's day (On a winter's day); If I didn't tell her (If I didn't tell her); I could leave today (I could leave today); California dreamin' (California dreamin'); On such a winter's day;"),
]

# careless whisper
song = Song.find_by_name("Careless Whisper")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus", reps: 3)
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(progression_template: progression_template_2, tag: "Verse 1", lyrics: "I feel so unsure, As I take your hand and lead you to the dance floor; As the music dies, Something in your eyes; Calls to mind a silver screen, And all of its sad goodbyes;"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 1", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    Progression.create(progression_template: progression_template_2, tag: "Verse 2", lyrics: "Time can never mend, The careless whispers of a good friend; To the heart and mind, Ignorance is kind; There's no comfort in the truth, Pain is all you'll find"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 2", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    Progression.create(progression_template: progression_template_2, tag: "Bridge", lyrics: "Tonight the music seems so loud, I wish that we could lose this crowd; Maybe it's better this way, We'd hurt each other with the things we want to say; We could have been so good together, We could have lived this dance forever; Now who's gonna dance with me... Play stay"),
    Progression.create(progression_template: progression_template_3, tag: "Chorus 3", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    Progression.create(progression_template: progression_template_2, tag: "Outro", lyrics: ""),
]

# ram ranch
# song = Song.find_by_name("Ram Ranch")

# caca en la cabeza
song = Song.find_by_name("Caca en la cabeza")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 2)
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor_seventh, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Mi primer alimento fue leche materna, me enchufaron nesquik como cosa buena; Yogures Petit me compraba mi abuela, Serenito, Yimmy, postrecitos de mierda; Mc Donalds, Burguer King, chatarra por las venas, Recuerdo Pumper Nic con sus puertas abiertas; ofreciéndome a mí cajitas y sorpresas, y hoy al fin comprendí que su comida apesta;", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Chicle pa' masticar y arruinarme las muelas, Bebida oscurita con su roja etiqueta; queriéndome engañar de ofertas navideñas, Ya no te compro más, tus anuncios: mi ofensa.; Hoy día puedes comprar arroz, trigo y lenteja, Hay verdura a granel de transgénicas huertas; Te sugiero también del agua estés alerta, y comienza a poner en tus frascos reservas; Rebobinando atrás, hombre de las cavernas no bebía champán; ni cuidaban sus prendas, poco eran de hablar, y asombrados de estrellas, tocaban música con ramitas y piedras", reps: 2 ),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Creo que hay que volver a las antiguas eras, de muerte natural, sin remedio ni queja; y ojalá que mañana cuando amanezca, me coma un dinosaurio y se acabe mi pena" ),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "La vaquita está muerta y ya nadie la respeta, pobrecita ya sufrió y le comen la molleja; su lengüita mascó pasto de pradera, y su leche la dio, no esperó recompensa; Lo mismo que un pollo que crece entre maderas, que le inyectan hormonas pa' que gordo parezca; ¿Qué tan rico será un humano en bandeja? rostizado quizá no nos demos ni cuenta", reps: 2 ),
    Progression.create(progression_template: progression_template_1, tag: "Verse 4", lyrics: "Si escupimos pa' arriba nos cae en la geta, Si miramos tv: caca en nuestras cabezas; No nos enseñan bien, (en la escuela te inventan y te enferman); Transmitir el saber de boquita en oreja", reps: 1 ),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Creo que hay que volver a las antiguas eras, de muerte natural, sin remedio ni queja; y ojalá que mañana cuando amanezca, me coma un dinosaurio y se acabe mi pena", reps: 1 ),
]

# deja de llorar - el polaco
song = Song.find_by_name("Deja de Llorar")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.progressions = [
    Progression.create(progression_template: progression_template_1, tag: "Verse 1", lyrics: "Deja de llorar, deja de sufrir; ya no puede verte más así; El no se merece tu amor; Y olvidate, de ese hombre infiel que tu hizo sufrir; Porque desde hoy, tu vas a ser feliz, junto a mí;"),
    Progression.create(progression_template: progression_template_1, tag: "Verse 2", lyrics: "Y dejame enseñarte, cuanto yo te quiero; Voy a demostrarte con mi amor; Que yo no soy igual, a todos los que amastes; Quiero hacerte mia, ser tu amor"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 1", lyrics: "Porque ya no aguanto mas; El rose de tu piel; A mi me vuelve loco de placer; Es tan grande el deseo, No me puedo contener", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Break", lyrics: "", reps: 2),
    Progression.create(progression_template: progression_template_1, tag: "Verse 3", lyrics: "Y dejame enseñarte, cuanto yo te quiero; Voy a demostrarte con mi amor; Que yo no soy igual, a todos los que amastes; Quiero hacerte mia, ser tu amor"),
    Progression.create(progression_template: progression_template_1, tag: "Chorus 2", lyrics: "Porque ya no aguanto mas; El rose de tu piel; A mi me vuelve loco de placer; Es tan grande el deseo, No me puedo contener", reps: 2),
]

# toune d'automne

song = Song.find_by_name("Toune d'Automne")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus A")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus B")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Break")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 2),
]

progression_template_6 = ProgressionTemplate.create(song: song, tag: "Ending")
progression_template_6.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Comment ça va, ma p'tite soeur? Viens que j'te serre dans mes bras; Pis as-tu r'trouvé l'bonheur dans ton trip au Canada? Dans l'bout c't'année, il s'est pas passé grand chose c't'un peu morose;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "J'espère au moins qu'c'était l'fun là-bas, j'suis fier que tu m'aies pas ramené; Un beau-frère de l'Alberta ça m'aurait un peu ébranlé; Jure-moi donc que c'fois là tu restes à'maison, pour de bon;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 1", lyrics: "Anyway, j'suis content, que tu r'viennes, t'arrives en même temps que l'autmone; T'sais qu'ça m'a fait ben d'la peine, de t'voir partir ma mignonne"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Icitte y'a popa qui s'remet de sa p'tite opération; T'aurais dû l'voir y fakait, fallait l'traiter aux p'tits oignons; Et môman, s'est inquiétée toute l'année à cause de toé;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 4", lyrics: "De mon bord j'ai décidé d'arrêter de végéter; J'rentre à l'université on verra c'que ça va donner; Mais tu m'connais, j'pas motivé plus qu'il faut c'est pas nouveau;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Chorus 2", lyrics: "Anyway, j'suis content, que tu r'viennes, t'arrives en même temps que l'autmone; T'sais qu'ça m'a fait ben d'la peine, de t'voir partir ma mignonne"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 5", lyrics: "J'ai vu Simon le mois passé ça avait pas trop l'air de filer; Y m'a dit qu't'avais pas appelé depuis sa fête en février; Si tu l'aimes pu, faudrait peut-être pas l'naiser c't'un bon buddy;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 6", lyrics: "Et puis toé ma p'tite soeur es-tu toujours aussi perdue?; C'est tu encore la grosse noirceur ou ben si t'as r'pris l'dessus?; T'sais qu'la vie est parsemée de p'tites misères faut pas t'en faire;"),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Chorus 3", lyrics: "Anyway, j'suis content, que tu r'viennes, t'arrives en même temps que l'autmone; T'sais qu'ça m'a fait ben d'la peine, de t'voir partir ma mignonne"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Break", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_6, tag: "Outro", lyrics: "Anyway, j'suis content, que tu r'viennes, t'arrives en même temps que l'autmone;"),
]

# salut les amoureux
song = Song.find_by_name("Salut les Amoureux")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Pre-Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]
progression_template_3 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Couplet 1", lyrics: "Les matins se suivent et se ressemblent; Quand l'amour fait face au quotidien; On n'était pas fait pour vivre ensemble; Ça n'suffit pas toujours de s'aimer bien"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pré-Refrain 1", lyrics: "C'est drôle, hier, on s'ennuyait; Et c'est à peine si l'on trouvait; Des mots pour se parler du mauvais temps; Et maintenant qu'il faut partir; On a cent mille choses à dire; Qui tiennent trop à coeur pour si peu de temps;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Refrain 1", lyrics: "On s'est aimé comme on se quitte; Tout simplement sans penser à demain; À demain qui vient toujours un peu trop vite; Aux adieux qui quelquefois se passent un peu trop bien;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Couplet 2", lyrics: "On fait c'qu'il faut, on tient nos rôles; On se regarde, on rit, on crâne un peu; On a toujours oublié quelque chose; C'est pas facile de se dire adieu;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pré-Refrain 2", lyrics: "Et l'on sait trop bien que tôt ou tard; Demain peut-être ou même ce soir; On va se dire que tout n'est pas perdu; De ce roman inachevé, on va se faire un conte de fées; Mais on a passé l'âge, on n'y croirait plus;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Refrain 2", lyrics: "On s'est aimé comme on se quitte; Tout simplement sans penser à demain; À demain qui vient toujours un peu trop vite; Aux adieux qui quelquefois se passent un peu trop bien;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Couplet 3", lyrics: "Roméo, Juliette et tous les autres; Au fond de vos bouquins, dormez en paix; Une simple histoire comme la nôtre; Est de celle qu'on n'écrira jamais"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Pré-Refrain 3", lyrics: "Allons, petite, il faut partir; Laisser ici nos souvenirs; On va descendre ensemble si tu veux; Et quand elle va nous voir passer; La patronne du café va encore nous dire; \"Salue les amoureux\""),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Refrain 3", lyrics: "On s'est aimé comme on se quitte; Tout simplement sans penser à demain; À demain qui vient toujours un peu trop vite; Aux adieux qui quelquefois se passent un peu trop bien;"),
]

# ça va pas changer le monde
song = Song.find_by_name("Ça va pas changer le monde")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 6),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, modifier: -1),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Couplet", lyrics: "C'est drôle, tu es partie; Et pourtant, tu es encore ici; Puisque tout, me parle de toi; Un parfum de femme, l'écho de ta voix; Ton adieu, je n'y crois pas du tout; C'est un au revoir, presqu'un rendez-vous...;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Refrain 1", lyrics: "Ça va pas changer le monde; Il a trop tourné sans nous; Il pleuvra toujours sur Londres; Ça va rien changer du tout; Qu'est-ce que ça peut bien lui faire; Une porte qui s'est refermée; On s'est aimés, n'en parlons plus; Et la vie continue;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Refrain 2", lyrics: "Ça va pas changer le monde; Que tu changes de maison; Il va continuer, le monde; Et il aura bien raison; Les poussières d'une étoile; C'est ça qui fait briller la voie lactée; On s'est aimés, n'en parlons plus, et la vie continue;", key: Key.find_by_shorthand("F")),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Refrain 3", lyrics: "Ça va pas changer le monde; Ça va pas le déranger; Il est comme avant le monde; C'est toi seule qui a changé; Moi je suis resté le même; Celui qui croyait que tu l'aimais; C'était pas vrai, n'en parlons plus; Et la vie continue;", key: Key.find_by_shorthand("F#")),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Outro", lyrics: "", key: Key.find_by_shorthand("G")),
]

# Wagon wheel
song = Song.find_by_name("Wagon wheel")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse")
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 1", lyrics: "Heading down south to the land of the pines; I'm thumbing my way into North Caroline; Staring up the road and pray the gods I see headlights; I made it down the coast in seventeen hours; Picking me a bouquet of dogwood flowers; And I'm a-hopin' for Raleigh, I can see my baby tonight;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 1", lyrics: "So rock me mama like a wagon wheel; Rock me mama any way you feel; Hey-ey, mama rock me; Rock me mama like the wind and the rain; Rock me mama like a southbound train; Hey-ey mama rock me;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Break 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 2", lyrics: "Running from the cold up in New England; I was born to be a fiddler in an old time string band; My baby plays a guitar, I pick a banjo now; Oh north country winters keep a-getting me down; I lost my money playing poker so I had to leave town; But I ain't turning back to living that old life no more;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 2", lyrics: "So rock me mama like a wagon wheel; Rock me mama any way you feel; Hey-ey, mama rock me; Rock me mama like the wind and the rain; Rock me mama like a southbound train; Hey-ey mama rock me;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Break 2", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Verse 3", lyrics: "Walkin' to the south out of Roanoke; I caught a trucker out of Philly had a nice long toke; But he's a heading west from the Cumberland gap to Johnson City, Tennessee; And I gotta get a move on before the sun; I heard my baby calling my name and I know that she's the only one; And if I died in Raleigh, at least I will die free;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 3 [Quiet]", lyrics: "So rock me mama like a wagon wheel; Rock me mama any way you feel; Hey-ey, mama rock me; Rock me mama like the wind and the rain; Rock me mama like a southbound train; Hey-ey mama rock me;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Chorus 4", lyrics: "So rock me mama like a wagon wheel; Rock me mama any way you feel; Hey-ey, mama rock me; Rock me mama like the wind and the rain; Rock me mama like a southbound train; Hey-ey mama rock me;", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Outro", lyrics: "", reps: 3),
]

# En berne
song = Song.find_by_name("En berne")

progression_template_1 = ProgressionTemplate.create(song: song, tag: "Intro")
progression_template_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
]

progression_template_2 = ProgressionTemplate.create(song: song, tag: "Verse", reps: 4)
progression_template_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
]

progression_template_3 = ProgressionTemplate.create(song: song, tag: "Break 1")
progression_template_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_template_4 = ProgressionTemplate.create(song: song, tag: "Chorus")
progression_template_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
]

progression_template_5 = ProgressionTemplate.create(song: song, tag: "Post-Chorus")
progression_template_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

song.progressions = [
    Progression.create(song: song, progression_template: progression_template_1, tag: "Intro", lyrics: "", reps: 2),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 1", lyrics: "J'suis né da'ins années '70s dans un Québec en plein changement; Où l'emblême de la fleur-de-lys donnait un peu d'espoir aux gens; Mais quand j'regarde ça aujuord'hui j'suis donc pas fier de ma patrie; Ça dort au gaz da'ins bungalows le cul assis su'l statut quo; En s'gavant de télévision et de talk shows les plus stupides; Se laissant mourir su'l divan avec leur petit air candide; Dans ce royaume de la poutine on s'complète en médiocrité; Ben satisfaits de notre routine et du bonheur préfabriqué;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 2", lyrics: "\"Prendrais-tu un p'tit gratteux?\" me dit l'caissier au dépanneur; \"Enweye le gros, sors ton p'tit deux, être millionnaire c'est le bonheur\"; Y's'met à rêver le samedi, qu'y va p't'être quitter son taudis; Espère toujours maudit moron, t'as une chance sur quatorze millions; Dans l'stationnement du casino un gars s'tire une balle dans la tête; Ayant tout flobé son magot y'avait pu trop l'coeur à la fête; Mais l'gouvernement s'en balance, y's'nourrit à même les gamblers; En exploitant leur dépendance, un peu comme le f'rait un pusher;"),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 2", lyrics: "\"Prendrais-tu un p'tit gratteux?\" me dit l'caissier au dépanneur; \"Enweye le gros, sors ton p'tit deux, être millionnaire c'est le bonheur\"; Y's'met à rêver le samedi, qu'y va p't'être quitter son taudis; Espère toujours maudit moron, t'as une chance sur quatorze millions;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Pré-Refrain 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Refrain 1", lyrics: "Si c'est ça l'Québec moderne ben moi j'mets mon drapeau en berne; Et j'emmerde tous les bouffons qui nous gouvernent!; Si tu rêves d'avoir un pays ben moi j'te dis qu't'es mal parti; T'as ben plus de chances de gagner à' loterie...; "),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Post-Refrain 1", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 3", lyrics: "On a été pendant des années un petit peuple de yes-man; Qui marchait les fesses serrées quand arrivait le foreman; Aujourd'hui ça' un peu changé les gars sont tous syndiqués; Ça jase trois-quatre autour d'une pelle en r'gardant le plus jeune faire du zèle; Mais faudrait pas s'réjouir trop vite on est encore des porteurs d'eau; À la solde des gens de l'élite et des pleins d'marde en tuxedo; Quand l'boss d'une grosse corporation ferme son usine en Gaspésie; 'Te d'mandera pas ton opinion y' va t'slaquer sans t'dire merci!; "),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Break 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 4", lyrics: "Un robineux quête dans la rue au pied d'un grand building en verre; Y va passer inaperçu à la sortie des actionnaires; C'qui compte pour eux c'est les revenus et non les problèmes de la terre; \"C'pas d'ma faute si t'es un trou d'cul moi l'important c'est que j'prospère\"; Et l'premier-ministre fait semblant qui s'en fait pour les pauvres gens; Alors qu'on sait qu'y est au service des fortunés et d'leurs business; L'environnement, la pauvreté ç'pas des sujets prioritaires; On n'entend pas beaucoup parler derrière les portes des ministères;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Pré-Refrain 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Refrain 2", lyrics: "Si c'est ça l'Québec moderne ben moi j'mets mon drapeau en berne; Et j'emmerde tous les bouffons qui nous gouvernent!; Si t'es content de ce pays ben ça mon homme c'est ton avis; Tu dois être le PDG d'une compagnie...;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Post-Refrain 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_2, tag: "Couplet 5", lyrics: "Quand on apprend que dans le nord y's'passe de quoi d'pas catholique; Que nos forêts sont mises à mort ça jase dans l'opinion publique; Deux s'maines et ça sombre dans l'oubli l'histoire est morte et enterrée; Et dans le parc d'la Vérendrye ils continuent à tout raser; C'est ça l'problème de ma patrie c'est qu'y'a pas personne pour s'indigner; Contre la fausse démocratie qui sert les riches et les banquiers; Dans cette contrée peuplée d'ignares 'faut pas trop s'rappeler d'son histoire; Ici y'a juste les plaques de char qu'y ont encore un ti-peu d'mémoire...;"),
    Progression.create(song: song, progression_template: progression_template_3, tag: "Pré-Refrain 3", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Refrain 3", lyrics: "Si c'est ça l'Québec moderne ben moi j'mets mon drapeau en berne; Et j'emmerde tous les bouffons qui nous gouvernent!; Si c'est ça qu't'appelles une nation, probable que tu sois assez con; T'es mûr pour te présenter aux élections...;"),
    Progression.create(song: song, progression_template: progression_template_5, tag: "Post-Refrain 2", lyrics: ""),
    Progression.create(song: song, progression_template: progression_template_4, tag: "Refrain 4", lyrics: "Si c'est ça l'Québec moderne ben moi j'mets mon drapeau en berne; Si c'est ça l'Québec moderne ben moi j'mets mon drapeau en berne;"),
    Progression.create(song: song, progression_template: progression_template_1, tag: "Fin", lyrics: ""),
]
