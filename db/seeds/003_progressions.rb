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
song = Song.find(1)
progression_1 = Progression.create(tag: "Intro")
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1, progression: progression_1)  # I ----
progression_2 = Progression.create(tag: "Verse")    # C--Am--F--G--
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1, progression: progression_2)  # I --
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, sequence: 2, progression: progression_2)  # vi --
ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 3, progression: progression_2)  # IV --
ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 4, progression: progression_2)  # V --
progression_3 = Progression.create(tag: "Chorus")    # Am-G-C-F- Am--G--
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1, progression: progression_3)  # vi -
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 2, progression: progression_3)  # V -
ProgressionChord.create(chord: chord__major, degree: 1, duration: 1, sequence: 3, progression: progression_3)  # I -
ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 4, progression: progression_3)  # IV -
ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 5, progression: progression_3)  # vi --
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 6, progression: progression_3)  # V --
ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 7, progression: progression_3)  # I ----

SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 2, tag: "Verse 1", lyrics: "I could go off the deep end; I can kill all my best friends; I can follow these stylish trends; and god knows I can make amends;")
SongProgression.create(song: song, progression: progression_2, sequence: 2, tag: "Verse 1", lyrics: "but I've got an angry heart; filled with cancer and poppy tarts; if this is how you folks make art; it's fucking depressing;")
SongProgression.create(song: song, progression: progression_3, sequence: 3, tag: "Chorus 1", lyrics: "and it's sad to know that we are not alone; and it's sad to know there's no honest way out;")
SongProgression.create(song: song, progression: progression_1, sequence: 4, tag: "Post-Chorus", lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Verse 2", lyrics: "I'm afraid to leave the house; I'm as timid as a mouse; I'm afraid if I go out; I'll outwear my welcome;")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Verse 2", lyrics: "I'm not a courageous man; I don't have any big lasting plans; I'm too cowardly to take a stand; I want to keep my nose clean;")
SongProgression.create(song: song, progression: progression_3, sequence: 6, tag: "Chorus 2A", lyrics: "and it's sad to know that we're not alone in this; and it's sad to know there's no honest way out;")
SongProgression.create(song: song, progression: progression_3, sequence: 7, tag: "Chorus 2B", lyrics: "in this life we lead, we could conquer everything; if we could just get the braves to get out of bed in the morning;")
SongProgression.create(song: song, progression: progression_1, sequence: 8, tag: "Outro", lyrics: "")

# we shall all die alone someday - ajj
song = Song.find(2)
progression_1 = Progression.create(tag: "Intro")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 1, progression: progression_1)
progression_2 = Progression.create(tag: "Verse")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 2, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 3, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 4, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 5, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 6, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 7, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 8, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 9, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 10, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 11, progression: progression_2)
progression_3 = Progression.create(tag: "Ending")
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 1, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 2, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 3, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 4, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 5, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 6, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 7, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 8, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 9, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 1, sequence: 10, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 11, progression: progression_3)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 12, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 13, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 14, progression: progression_3)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 15, progression: progression_3)

SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 2, tag: "Verse 1", lyrics: "Bad things happen everyday; cancer and murder and herpes and AIDS; we'll all die alone someday; I hope we don't die alone;")
SongProgression.create(song: song, progression: progression_2, sequence: 3, tag: "Verse 2", lyrics: "And our vices make it bearable enough; to know our lives are shit, but to not give a fuck; They make it bearable enough to help us on our way;")
SongProgression.create(song: song, progression: progression_2, sequence: 4, tag: "Verse 3", lyrics: "But still it feels nice to feel alive; To try to find a home or someplace to thrive; It feels great to be alive except for all those times we feel dead;")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Verse 4", lyrics: "And how do we maintain our buoyancy; in this salty lake of shit and tears and murder and disease? How do we keep ourselves afloat in all this sad stuff?")
SongProgression.create(song: song, progression: progression_3, sequence: 6, tag: "Intro", lyrics: "I've gotta know the answers I've gotta know it now; And I need to know the answers I have to know how; We'll all die alone someday, I hope we don't die alone;")

# forest fire - ajj
song = Song.find(3)
progression_1 = Progression.create(tag: 'Verse')
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 1, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 2, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 4, sequence: 3, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 4, sequence: 4, progression: progression_1)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 5, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 6, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 7, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 8, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 9, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 10, progression: progression_1)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 11, progression: progression_1)
progression_2 = Progression.create(tag: 'Chorus')
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 1, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 2, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 3, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 4, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 5, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 6, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 7, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 8, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4, sequence: 9, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 4, sequence: 10, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 2, sequence: 11, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, sequence: 12, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 3, duration: 1, sequence: 13, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 14, progression: progression_2)
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 15, progression: progression_2)

SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Verse 1", lyrics: "Waking from napping with a bad taste in your mouth; Wishing you were sleeping, you don't want to leave the house; Dripping from your dreaming of a habit you renounced; Get out of bed, please go away, get out, get out, get out;")
SongProgression.create(song: song, progression: progression_1, sequence: 2, tag: "Verse 2", lyrics: "You see a liar in the mirror he's sneering in that way; That makes you feel unsafe, insane and you hate to see his face; You punch the mirror to shut him up but he won't go away; He just multiplies, intensifies, he's twenty tiny blades; ")
SongProgression.create(song: song, progression: progression_2, sequence: 3, tag: "Chorus", lyrics: "Is it getting better? It's really getting worse; I'll give a thousand apologies for a thousand hurts; The forest is on fire but we're gonna let it burn; We're controlling it; We've got it handled; Thanks for your concern;")

# A Song Dedicated to the Memory of Stormy the Rabbit - AJJ
song = Song.find(3)
progression_1 = Progression.create(tag: "Verse A")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 2, progression: progression_1)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 3, progression: progression_1)
progression_2 = Progression.create(tag: "Verse B")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 7, duration: 1, sequence: 2, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 6, duration: 2, sequence: 3, progression: progression_2)
ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, sequence: 4, progression: progression_2)
progression_3 = Progression.create(tag: "Ending")
ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1, progression: progression_3)

SongProgression.create(song: song, progression: progression_2, sequence: 1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 2, tag: "Verse 1", lyrics: "For four fortnights I have fled from my fortress")
SongProgression.create(song: song, progression: progression_1, sequence: 3, tag: "Verse 1", lyrics: "Foraging forests five footsteps in length")
SongProgression.create(song: song, progression: progression_1, sequence: 4, tag: "Verse 1", lyrics: "Fortitude found within forty ounce bottles")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Verse 1", lyrics: "Flowing like flies from your face; From your face;")
SongProgression.create(song: song, progression: progression_1, sequence: 6, tag: "Verse 2", lyrics: "And my neighborhood; It's been filled brim with black cats")
SongProgression.create(song: song, progression: progression_2, sequence: 7, tag: "Verse 2", lyrics: "And when I go driving they walk in my path all the time; Every time;")
SongProgression.create(song: song, progression: progression_1, sequence: 8, tag: "Interlude", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 9, tag: "Interlude", lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 10, tag: "Interlude", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 11, tag: "Verse 3", lyrics: "First we were babies, we're birthing and dying")
SongProgression.create(song: song, progression: progression_1, sequence: 12, tag: "Verse 3", lyrics: "Then we were children, we're playing and crying")
SongProgression.create(song: song, progression: progression_1, sequence: 13, tag: "Verse 3", lyrics: "And then we're teenagers and smoking and fucking;")
SongProgression.create(song: song, progression: progression_1, sequence: 14, tag: "Verse 3", lyrics: "But now we're all grown up and we're sadly sighing;")
SongProgression.create(song: song, progression: progression_1, sequence: 15, tag: "Verse 3", lyrics: "And lacking but lurking, and licking our wounds;")
SongProgression.create(song: song, progression: progression_1, sequence: 16, tag: "Verse 3", lyrics: "We've created by lusting and lying to ourselves and to others;")
SongProgression.create(song: song, progression: progression_2, sequence: 17, tag: "Interlude", lyrics: "We're sadly sighing x4;")
SongProgression.create(song: song, progression: progression_1, sequence: 18, tag: "Verse 4", lyrics: "And I'd like to be a big ball of meat;")
SongProgression.create(song: song, progression: progression_2, sequence: 19, tag: "Verse 4", lyrics: "That bees can buzz around and eat when I die; So that I might be granted one sense of purpose;")
SongProgression.create(song: song, progression: progression_3, sequence: 20, tag: "Ending", lyrics: "")

# love in the time of hpv - ajj
song = Song.find_by_name("Love in the Time of Human Papillovirus")

progression_1 = Progression.create(tag: "Riff")

progression_1.progression_chords = [
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

progression_2 = Progression.create(tag: "Verse")

progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_3 = Progression.create(tag: "Chorus A")

progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

progression_4 = Progression.create(tag: "Chorus B")

progression_4.progression_chords = [
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

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "You will cough up crows that peck my eyes; And I will do nothing but go blind;")
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 1", lyrics: "But my heart; It has eyes; And my love; It has sight; Even though; It may be a little cloudy;")
SongProgression.create(song: song, progression: progression_1, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "And you will break my back for all the burdens I lay upon it; But I will never blame you for those bees inside this bonnet;")
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 2", lyrics: "And my lungs; Will grow cancers; And my back it will grow achey; I will buy us an acre; Of some land in the city; We could live there together or I'll live alone less happy; But I'll live... Unfortunately;")
SongProgression.create(song: song, progression: progression_1, tag: "Ending", lyrics: "")

# kokopelli face tattoo - ajj
song = Song.find_by_name("Kokopelli Face Tattoo")

progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_2 = Progression.create(tag: "Verse A")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_3 = Progression.create(tag: "Verse B")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, bass_degree: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, bass_degree: 2),
]

progression_4 = Progression.create(tag: "Chorus")
progression_4.progression_chords = [
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

progression_5 = Progression.create(tag: "Interlude (short)")
progression_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3, bass_degree: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 3),
]

progression_6 = Progression.create(tag: "Interlude (long)")
progression_6.progression_chords = [
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

progression_7 = Progression.create(tag: "Bridge")
progression_7.progression_chords = [
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

progression_8 = Progression.create(tag: "Verse C")
progression_8.progression_chords = [
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

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "I was a sexy little viper room, in the corner of a King Tut tomb; When the hate train started, goin' \"Choo-choo\"")
SongProgression.create(song: song, progression: progression_3, tag: "Verse 1", lyrics: "I was a rat on a burnin' ship, and when we sunk, our fire got put out; It was just like the great plague, just like the birth of underwear")
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 1", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less")
SongProgression.create(song: song, progression: progression_5, tag: "Interlude 1", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "I was a wheel in a war machine, now I’m a toilet in a restaurant; Somebody’s gotta do it, I know my place")
SongProgression.create(song: song, progression: progression_3, tag: "Verse 2", lyrics: "I was a baby-killin' Cadillac, Now I’m a drug induced heart attack; Somebody’s gotta do it, I know my place")
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 2", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less")
SongProgression.create(song: song, progression: progression_6, tag: "Interlude 2", lyrics: "")
SongProgression.create(song: song, progression: progression_7, tag: "Bridge", lyrics: "Have you ever wanted to be, have you ever wanted to see; Someone better, in the mirror? Have you ever wanted to go, have you ever wanted to know; Somewhere greener? Somewhere cleaner?; I bet you've got somethin' beautiful in mind")
SongProgression.create(song: song, progression: progression_8, tag: "Verse 3", lyrics: "They’re gonna beat me till I’m black and blue; Give me a Kokopelli face tattoo; And I’ll tell you a secret; \"Kreuz\" is German for \"Williams\"; In the blood cult of the misled youth; I’ve got a bad case of the yellow flashlight blues; Let me tell you some weird shit; There's gonna be a big old Civil War inside my house tonight")
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 3", lyrics: "Hey dude, I hate everything you do; But I’m trying really hard to not hate you 'cause; Hating you won’t make you suck any less; Hating you won’t make you suck any less; Hating you won’t make you suck any less")

# bill collector's theme song - apes of the state
song = Song.find_by_name("Bill Collectors' Theme Song")

progression_1 = Progression.create(tag:"Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_2 = Progression.create(tag:"Verse")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_3 = Progression.create(tag:"Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_4 = Progression.create(tag:"Bridge 1")
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_5 = Progression.create(tag: "Bridge 2")
progression_5.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

progression_6 = Progression.create(tag: "Ending")
progression_6.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "When I was just a little kid they told me to dream big; you can do anything; when I got older they told me to stop dreaming; start being more realistic, make the coffee do the dishes; but I can't seem to keep my head out of the clouds; cause whats the point of living life; to work until I die; That can't be it and if it is then I want out; and honestly I never had a dream of getting older; but here I am what can I do about it, tell me what to do about it now;")
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 1", lyrics: "Cause I never wanted to be every single stereotype of a white middle class 20-something pissed at the economy; I never meant to be the epitome of a quarter life crisis and being a junkie didn't live up to the hype;")
SongProgression.create(song: song, progression: progression_1, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "When I was just a little kid they told me I was special; Then I grew up and found out they told that to every single one of us; get addicted to our drugs then go away to universities; where we'll sell you dreams then make you work for free; They handed us an economy thats destined us for poverty; then had the nerve to call us soft and lazy for complaining; cause they're from a generation where you could be what you wanted to be; but baby I'm a 90's kid, only 90's kids will understand this;")
SongProgression.create(song: song, progression: progression_4, tag: "Bridge", lyrics: "got bill collectors calling us to pay back student loans; but they can't ever find us if we throw away our phones; then we can sit in diners, drinking coffee smoking cigarettes outside; look in each others' eyes without cell phone lights to hide behind and; we can just kick off our shoes and make these sidewalks home; we'll write songs and sing for food;")
SongProgression.create(song: song, progression: progression_5, tag: "Bridge", lyrics: "and we'll never be alone; never be alone, never be alone, never be alone when we're with friends; and we'll never owe shit to anyone else; no we'll never owe shit to anyone else; no we'll never owe shit to anyone else; no we'll never owe shit to anyone;")
SongProgression.create(song: song, progression: progression_6, tag: "Ending", lyrics: "")

# I listened - apes of the state

song = Song.find_by_name("I Listened")

progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
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

progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
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

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "Last night when I walked into your house I noticed that the couch had moved; And I wanted to ask you about it; But you were talking so when you finished I opened up my mouth; And you called me out for being bad at listening; So I wrote this song to tell ya just how well that I can listen; And that I think that you are really cute; And I thought that maybe I should wait to tell you that I like you but; I don't really have that much to lose; ")
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 1", lyrics: "And I could learn your favorite song and play it on my guitar; and I'll probably sing it all wrong but it might catch your attention; and I don't know your favorite song but it's probably by Mars Volta; cause you said you really like them when we talked and I listened; yeah I listened;")
SongProgression.create(song: song, progression: progression_1, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "So this morning when I woke up in my bed I made a list of all the things you told me last night that I had inside my head; like that yellow is your favorite because it's a happy color; and that you have been sad for as long as you remember; and that the way your kitchen looked made you upset because it was a mess and that's the way things look when you're depressed; and you sat across the room on that rocking chair you said you hate cause it is so loud and I wished that you had sat next to me on the couch;")
SongProgression.create(song: song, progression: progression_2, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 3", lyrics: "And I'm scared that this list is too long; That I can't fit all these things into a song; And still keep your attention; So I'm trying hard to mention some important things that I feel will really demonstrate; Just how well that I listened;")
SongProgression.create(song: song, progression: progression_2, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 4", lyrics: "Like how you said with tears in your eyes that you wish that being grateful was enough to keep you from feeling sad all the time; And that your favorite flowers are impatiens; And that when you love somebody you wait; Patiently for them; 2> And that your favorite movie is the Shawshank Redemption; And that serenity means listening to the water down at Tucquan Glenn; And how you make poor decisions with the people that you choose to date;")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 5", lyrics: "And you'll probably think I'm crazy for this and I'd tell you that I don't give a shit but that would be a lie because I care; What you think about me; And I just really, desperately want to be your next poor decision; Be your next poor decision; Be your next poor decision;")
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 2", lyrics: "And I could learn your favorite song and play it on my guitar; and I'll probably sing it all wrong but it might catch your attention; and I don't know your favorite song but it's probably by Mars Volta; cause you said you really like them when we talked and I listened; yeah I listened;")
SongProgression.create(song: song, progression: progression_1, tag: "Ending", lyrics: "")

# honey in the air - blackbird raum
song = Song.find_by(name: "Honey in the Hair")

progression_1 = Progression.create(tag: "Verse", reps: 4)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
]

progression_2 = Progression.create(tag: "Bridge", reps: 2)
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
]

progression_3 = Progression.create(tag: "Ending", reps: 6)
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "I fill my mouth up with air, honey in the hair; Honey in the hair, honey in the hair; I fill my life up with time, asleep in the vine; Whiskey and wine, whiskey and wine; Who makes the wind blow; I don't care, my eyes roll back in my head; Who makes the wind blow; I don't care, my eyes roll back in my head; I'm just walking in circles; I see the lines in chalk on the ground; I'm just walking in circles; I see the lines in chalk on the ground;")
SongProgression.create(song: song, progression: progression_1, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "I fill my mouth up with air; honey in the hair; Honey in the hair, honey in the hair; I fill my life up with time, asleep in the vine; Whiskey and wine, whiskey and wine; Who makes the wind blow; I don't care, my eyes roll back in my head; Who makes the wind blow; I don't care, my eyes roll back in my head; I'm just walking in circles; I see the lines in chalk on the ground; I'm just walking in circles; I see the lines in chalk on the ground; ")
SongProgression.create(song: song, progression: progression_2, tag: "Bridge", lyrics: "One day this will all come down; One day this will all come crashing right down;")
SongProgression.create(song: song, progression: progression_2, tag: "Ending", lyrics: "So go on with your life; We will bring you down; One day this will all come down; One day this will all come crashing right down; So go on with your life; We will bring you down;")

# coal - blackbird raum
song = Song.find_by(name: "Coal")
progression_1 = Progression.create(tag: "Verse", reps: 4)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
]

progression_2 = Progression.create(tag: "Break", reps: 4)
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_3 = Progression.create(tag: "Riff 1", reps: 8)
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
]

progression_4 = Progression.create(tag: "Bridge", reps: 8)
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "the pillars of the world were shaking like the legs of a drunk; hot winds ripped the hats off all the ladies all about town that day; then they caught us ran us ragged beat us bloody put us in a dirty cage; now we're screaming bloody murder we are starving won't see the ocean side again; now we're screaming bloody murder we are starving won't see the ocean side again;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Break 1", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "continents and mountain ranges boats out in the harbor; rivers clouds and cities all aflame; the sun went out the sky went red the horses our dancing in their skins; the taste of ash and sulfur on our lips; Where is my boy, where is my son. I seem to have lost him in the crowd; he was holding to my hand just a moment ago; I know he cannot find his way he is so small he is so lean he looks like; a scrap of paper on a branch;", reps: 2),
    SongProgression.create(progression: progression_3, tag: "Riff", lyrics: ""),
    SongProgression.create(progression: progression_4, tag: "Bridge", lyrics: "I am flesh and you are pale, I am sleeping you are dead; we're all playing cards as the ship goes down; We're living as if we are not, hanging from a precipice; shuddering and lurching off the edge; but someday this will all be gone, as fast a match can be struck; take warning for the veil is very thin; the signs aren't difficult to read: we tread so heavy on the ground; and one day the ground it may give way; "),
    SongProgression.create(progression: progression_2, tag: "Break 2", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "I see you gilded gentlemen, I wish I'd set a torch to you while I still had the freedom of my legs; I do not trust you with my life; I do not trust you with my past I do not trust your hands upon the world; but now I'm sunken in the ground, all my strength to move is gone; and screaming is the last recourse that I have; you've left us with a barren earth, we know we are the aching land; a scorching waste with all the life of coal;", reps: 2),
    SongProgression.create(progression: progression_3, tag: "Outro", lyrics: ""),
]

# devil's will - cousin boneless
song = Song.find_by(name: "Devil's Will")
progression_1 = Progression.create(tag: "Verse")

ProgressionChord.create(progression: progression_1, chord: chord__minor, degree: 4, duration: 8, sequence: 1)
ProgressionChord.create(progression: progression_1, chord: chord__minor, degree: 1, duration: 4, sequence: 2)
ProgressionChord.create(progression: progression_1, chord: chord__minor, degree: 4, duration: 4, sequence: 3)
progression_2 = Progression.create(tag: "Chorus")
ProgressionChord.create(progression: progression_2, chord: chord__minor, degree: 1, duration: 1, sequence: 1)
ProgressionChord.create(progression: progression_2, chord: chord__major, degree: 6, duration: 1, sequence: 2)
ProgressionChord.create(progression: progression_2, chord: chord__major, degree: 7, duration: 1, sequence: 3)
ProgressionChord.create(progression: progression_2, chord: chord__major, degree: 5, duration: 1, sequence: 4)
ProgressionChord.create(progression: progression_2, chord: chord__minor, degree: 4, duration: 1, sequence: 5)


SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 2, tag: "Verse 1", lyrics: "Tonight I'll play in the Devil's way; Tonight I'll do what my demons say; As they whisper, in such a subtle way")
SongProgression.create(song: song, progression: progression_1, sequence: 3, tag: "Verse 1", lyrics: "Tonight I'll sing of the Devil's things; Friendly fire and playful stings; We will grin while the church bells ring")
SongProgression.create(song: song, progression: progression_2, sequence: 4, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;")
SongProgression.create(song: song, progression: progression_1, sequence: 6, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 7, tag: "Verse 2", lyrics: "Tonight I'll feast with the feral beasts; With heavy breath and sharpened teeth; Keep the bones, savor the meat")
SongProgression.create(song: song, progression: progression_1, sequence: 8, tag: "Verse 2", lyrics: "Our glasses clink with the Devil's drink; In a raised whiskey bottle we all will sink; And we'll find, what the Devil thinks")
SongProgression.create(song: song, progression: progression_2, sequence: 9, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;")
SongProgression.create(song: song, progression: progression_2, sequence: 10, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;")
SongProgression.create(song: song, progression: progression_1, sequence: 11, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 12, tag: "Verse 3", lyrics: "Tonight I'll dance in the Devil's fire; Throw myself in, add to the pyre; To admire, so much to desire")
SongProgression.create(song: song, progression: progression_1, sequence: 13, tag: "Verse 3", lyrics: "Tonight I'll sleep by the Devil's cheek; As she culls with a lullaby so sweet; How unique, how the serpent speaks")
SongProgression.create(song: song, progression: progression_2, sequence: 14, tag: "Chorus", lyrics: "So come with me, I've got a story to tell;")
SongProgression.create(song: song, progression: progression_2, sequence: 15, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell;")
SongProgression.create(song: song, progression: progression_1, sequence: 16, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 17, tag: "Verse 3", lyrics: "Tonight we'll fulfill the Devil's will; Sign fine lines with a bloody quill; What was killed, well it suffers still")
SongProgression.create(song: song, progression: progression_2, sequence: 18, tag: "Chorus B", lyrics: "So come with us, we've got so much to tell;")
SongProgression.create(song: song, progression: progression_2, sequence: 19, tag: "Chorus B", lyrics: "And if we dig real deep I bet we can reach hell;")

# helm of ned kelly - blackbird raum
song = Song.find_by_name("The Helm of Ned Kelly")

progression_1 = Progression.create(tag: "Verse", reps: 2)
progression_1.progression_chords = [
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

progression_2 = Progression.create(tag: "Chorus")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_3 = Progression.create(tag: "Outro", reps: 8, key: Key.find_by_shorthand("Am"), scale: Scale.find_by_name("Natural Minor"))
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "Like a fist clutching bread; just to hoard and withhold like the grain that they locked in the silo; we'll be eating soup of stone til what we grow is what we own; but we won't steal from the land what's freely given; tear up the deeds to the land, throw the debts into the furnace; debts to god to the banks and to the landlord; don your armor don your helm, which was forged from an old plows blade; train your horses round and aim your guns at sydney;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Chorus 1", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    SongProgression.create(progression: progression_1, tag: "Break", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "down their lying in the brush was one bloody tethered horse; and one detective in the service of the crown; even though we're just one pistol against an army of policemen; I insist that we are many and they are few;"),
    SongProgression.create(progression: progression_2, tag: "Chorus 2", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "it was on van dieman's land where your father came in transport; chained like cattle to the deck of a ship; held hostage in a word, stolen from the shores of erin; south australia bound in bondage of the queen's men; tear up the deeds to the land, throw the debts into the furnace; debts to god to the banks and to the landlord; don your armor don your helm, which was forged from an old plows blade; train your horses round and aim your guns at sydney;"),
    SongProgression.create(progression: progression_2, tag: "Chorus 3", lyrics: "I was born from a seed that was swallowed by a mad woman; from the lips and the tongue of ceridwen; I had took just a taste that had splashed up from the black kettle; in the waves neither drowned nor aged a day;"),
    SongProgression.create(progression: progression_3, tag: "Outro", lyrics: ""),
]

# germinal - blackbird raum
song = Song.find_by_name("Germinal")

progression_1 = Progression.create(tag: "Intro", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2, modifier: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
]

progression_3 = Progression.create(tag: "Chorus", reps: 2)
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Verse 1", lyrics: "see how fast I can run,see how fast I can run; a window is closed in the cold, race up the stairs with a friend; sit in the hall; stare at a wall;"),
    SongProgression.create(progression: progression_3, tag: "Chorus 1", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    SongProgression.create(progression: progression_2, tag: "Break 1", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Verse 2", lyrics: "the one with the cold metal hands, up on a table undone; a tube in my womb all again, the breath and the clothes of a friend; close my eyes, a placenta dies;"),
    SongProgression.create(progression: progression_3, tag: "Chorus 2", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    SongProgression.create(progression: progression_2, tag: "Bridge", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Bridge", lyrics: "", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Bridge", lyrics: ""),
    SongProgression.create(progression: progression_3, tag: "Chorus 3", lyrics: "the words that you said by my hospital bed; on my back and bent at my knees; were talked through air were talked through teeth; through a pain in my stomach and blood on my sheets;"),
    SongProgression.create(progression: progression_2, tag: "Outro", lyrics: ""),
]

# witches - blackbird raum
song = Song.find_by(name: "Witches")
progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 4),
]
progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 2),
]
progression_3 = Progression.create(tag: "Pre-Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 2),
    ProgressionChord.create(chord: Chord.find_by(name: "Dominant Seventh"), degree: 5, duration: 4, sequence: 3),
]
progression_4 = Progression.create(tag: "Chorus")
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2, sequence: 4),
]

SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 2, tag: "Verse 1", lyrics: "in others' mouths, a scraping of rocks; who walk a rope, run along the ground, into the basket;")
SongProgression.create(song: song, progression: progression_2, sequence: 3, tag: "Verse 1", lyrics: " whither the sky is fatted of ice; come as the earth grows richer of blood; the doe is in season;")
SongProgression.create(song: song, progression: progression_3, sequence: 4, tag: "Pre-Chorus 1", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;")
SongProgression.create(song: song, progression: progression_4, sequence: 5, tag: "Pre-Chorus 1", lyrics: "")
SongProgression.create(song: song, progression: progression_4, sequence: 6, tag: "Chorus 1", reps: 3, lyrics: "but it won't be the witches that are burning this time; and it won't be the witches that are burning this time; but it won't be the witches that are burning this time;")
SongProgression.create(song: song, progression: progression_1, sequence: 7, tag: "Post-Chorus 1", reps: 2, lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 8, tag: "Verse 2", lyrics: "out in the wood, a passing of hours; in the jailhouse of limb, a passing of years, into the casket; ")
SongProgression.create(song: song, progression: progression_2, sequence: 9, tag: "Verse 2", lyrics: "I will not crouch, polluted with law; no traitor to witch, not traitor to wolf, judas escariot;")
SongProgression.create(song: song, progression: progression_3, sequence: 10, tag: "Pre-Chorus 2", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;")
SongProgression.create(song: song, progression: progression_4, sequence: 11, tag: "Pre-Chorus 2", lyrics: "")
SongProgression.create(song: song, progression: progression_4, sequence: 12, tag: "Chorus 2", reps: 3, lyrics: "but it won't be the witches that are burning this time; and it won't be the witches that are burning this time; but it won't be the witches that are burning this time;")
SongProgression.create(song: song, progression: progression_1, sequence: 13, tag: "Post-Chorus 2", reps: 4, lyrics: "")
SongProgression.create(song: song, progression: progression_2, sequence: 14, tag: "Verse 3", lyrics: "now the white wool is twisted round the land; the cowering altar and matricide borne, the stones they are screaming; ")
SongProgression.create(song: song, progression: progression_2, sequence: 15, tag: "Verse 3", lyrics: "I could call them men but they are not men, faces like blood rags; yet dressed to the fines, chariots surround us; ")
SongProgression.create(song: song, progression: progression_3, sequence: 16, tag: "Pre-Chorus 3", reps: 4, lyrics: "we pull our teeth out, laying down in easy places; we thicken the air with talk, but cover our eyes up with our hands; they're shooting the wolves from helicopters, can you believe that; out in the wide world, the wildest ones are vanishing quickly;")
SongProgression.create(song: song, progression: progression_4, sequence: 18, tag: "Chorus 3", lyrics: "but it won't be the witches burning this time;")

# plastic plague - broken bow
song = Song.find_by_name("Plastic Plague")

progression_1 = Progression.create(tag: "Chorus", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_2 = Progression.create(tag: "Verse", reps: 4)
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Verse 1", lyrics: "We're the murders of the machine; these doomed dinosaurs of iron; that choke away all of our dreams; leaving nightmares for us to lead;"),
    SongProgression.create(progression: progression_1, tag: "Chorus 1", lyrics: "Plastic plague; plastic plague;"),
    SongProgression.create(progression: progression_2, tag: "Verse 2", lyrics: "When you wake to a shrouded brown sky; with mushroom clouds and toxic smoke in your eyes; it is terrifying; we despise;"),
    SongProgression.create(progression: progression_1, tag: "Chorus 2", lyrics: "Plastic plague; plastic plague;"),
    SongProgression.create(progression: progression_2, tag: "Verse 3", lyrics: " why do the powers that be always Bogart; all the free and clean energy; oh they trade it for coal and dead dinosaurs; and deaf ears to fall on our pleas;"),
    SongProgression.create(progression: progression_1, tag: "Chorus 3", lyrics: "Plastic plague; plastic plague;"),
    SongProgression.create(progression: progression_1, tag: "Outro", lyrics: "sterilize; genocide; equalize; ignite; god damn their eyes;", reps: 2),
]

# scraps - broken bow
song = Song.find_by_name("Scraps")

progression_1 = Progression.create(tag: "Verse", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 1),
]

progression_2 = Progression.create(tag: "Break")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_3 = Progression.create(tag: "Bridge")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: "[Quiet]"),
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: "[Fast]"),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "indoctrined insignificance eats at your mortal soul; diligence and duty freedom dies it takes its toll; the noose around your neck will tighten, death will strengthen hold; for years the flesh that was your heart has slowly turned to coal;"),
    SongProgression.create(progression: progression_1, tag: "Pre-Chorus 1", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Chorus 1", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    SongProgression.create(progression: progression_2, tag: "Break 1", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "the blood the sweat and tears collect inside a little cup; you can't go back the clock ticks on the years you've given up; what i wouldn't give just to have another day at work; you sigh and rest, fall into death, you've finally out of luck; "),
    SongProgression.create(progression: progression_1, tag: "Pre-Chorus 2", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Chorus 2", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    SongProgression.create(progression: progression_2, tag: "Break 2", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "a cog inside an iron lung whose gears they have been jammed; by feeding fingers to a starving dog right from the masters hand; a glutton for envy, your life has been bought; your slaves have been caught, just leave us to rot;"),
    SongProgression.create(progression: progression_3, tag: "Bridge", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Solo", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Chorus 3", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; just seek your crown of shame the madness slowly turns to rage;"),
    SongProgression.create(progression: progression_1, tag: "Chorus 4", lyrics: "and you say you get paid; you're a slave to the wage; surviving off the peanuts that get tossed inside your cage; you say you get paid; you're a slave to the wage; and you will beg for death before the end;"),
]

# digitize the dirt - broken bow
song = Song.find_by_name("Digitize the Dirt")

progression_1 = Progression.create(tag: "Verse", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
]

progression_2 = Progression.create(tag: "Chorus", reps: 4)
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "There's a tourniquet around your neck to quench a bloody mind; let's drag our bodies to the woods and leave this filthy world behind; for shame the world, accursed world for shame; to play the game that points the blame to anyone but me;"),
    SongProgression.create(progression: progression_2, tag: "Verse 1", lyrics: "but me, but me, but me; we'll point it at anyone but me; what about you, its so fucking true; but me;"),
    SongProgression.create(progression: progression_1, tag: "Pre-Chorus 1", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Chorus 1", lyrics: "so let's mine the moon; let's put a colony on mars; let's kill the green in all the world; and snuff out all the stars;"),
    SongProgression.create(progression: progression_1, tag: "Break", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "cuz there's candlelight at dinner in an alley; there's fire burning all over this town; when this is over we will throw a party or a war; go to the city and burn it fucking down; "),
    SongProgression.create(progression: progression_2, tag: "Chorus 2", lyrics: "so let's digitize the dirt; and chastise the sky; lets hollow out the planet earth; and leave the rest to die;"),
]

# no earthlings - broken bow
song = Song.find_by_name("No Earthlings")

progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 2),
]

progression_2 = Progression.create(tag: "Chorus")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 2, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 1),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 1),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: "", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "well little did I know at the end of this road; the only way out was through a broken door; take your cards as they come, let chips fall; this life is a gamble so heed the last call;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "find myself again at the foot of this bed; visions of demons dance around in my head; the ugly truth is I'm not dead; we're just dying;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Pre-Chorus 1", lyrics: "", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Chorus 1", lyrics: "but I can't see past the clouds at night; helpless birds robbed of their flight; people are praying, false gods will delight; for no answers no reasons, no end is in sight;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Break", lyrics: "", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "a little bit of sleep will go a long way; if you see your blood it will break your day; unwind my mind claw at my face; and help me end this human race;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Bridge", lyrics: "", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Bridge", lyrics: "no answers, no reasons; no earthlings, no seasons; no answers, no reasons; no earthlings, no seasons;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Chorus 2", lyrics: "but i can't see past my eyes at night; desperate dreams robbed of their light; people are praying, no end is in sight; for no answers, no earthlings, no season to die;", reps: 2),
]

# lights - broken bow

song = Song.find_by_name("Lights")

progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 4),
]

progression_2 = Progression.create(tag: "Bridge")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

progression_3 = Progression.create(tag: "Bridge Ending")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

progression_4 = Progression.create(tag: "Ending")
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: "", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "when the lights go down in the city; just know they did not shine for me; just the moonlight on the water and the dew upon the leaves; not oil in a puddle or broken glass litters the streets;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Chorus", lyrics: "cuz im running out of town; meanwhile im running out on time; maybe one of these days I'll make it, if I dont I'll surely die; but when my time has come, I will know, I've heard the angels cry;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Bridge", lyrics: "so lets let the ashes of our time fall slowly 'till the wind can blow them away; cuz there ain't much left in this town that can still convince me to stay; we're just creating and destroying, the fate with which we're molding fades away;", reps: 5),
    SongProgression.create(progression: progression_3, tag: "Bridge", lyrics: "but in the end, i'm just happy to survive another day;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "when the lights go down in the city; just know they did not shine for me; just the moonlight on the water and the dew upon the leaves; not oil in a puddle or broken glass litters the streets;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Chorus 2", lyrics: "cuz im running out of town; meanwhile im running out on time; maybe one of these days I'll make it, if I dont I'll surely die; but when my time has come, I will know, I've heard the angels cry; ", reps: 2),
    SongProgression.create(progression: progression_4, tag: "Ending", lyrics: "", reps: 2),
]

# wrought iron bars - broken bow
song = Song.find_by_name("Wrought Iron Bars")

progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__minor, degree: 5, duration: 3),
]

progression_2 = Progression.create(tag: "Verse Ending A")
progression_2.progression_chords = [
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

progression_3 = Progression.create(tag: "Verse Ending B")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 6),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 3),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 3),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: "", reps: 3),
    SongProgression.create(progression: progression_2, tag: "Intro", lyrics: "", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "Time is cloaked in harmony; thrown out of the woods taken to the cities; break the bonds of deliquency;", reps: 3),
    SongProgression.create(progression: progression_2, tag: "Verse 1", lyrics: "by cutting the wires of your technocracy;", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "the bread that they feed us with leashes they lead us; on collars and dollars and riding on air; we're laundering, pondering, squatting your lives away;", reps: 3),
    SongProgression.create(progression: progression_3, tag: "Verse 2", lyrics: "steal your master's horses; your daughter's bobbles and drink all the wine;", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "we fester sequester; we beg to be pleased;", reps: 1),
    SongProgression.create(progression: progression_2, tag: "Verse 2", lyrics: "we find that all rows lead us back to our feet;", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "we stretch out the sinew yet still we continue; to spread it so think you can't notice it gone; no shackles will keep you so the poison still seeps through;", reps: 2),
    SongProgression.create(progression: progression_2, tag: "Verse 3", lyrics: "and I cannot sleep 'till the first light of dawn;", reps: 1),
    SongProgression.create(progression: progression_1, tag: "Verse 4", lyrics: "Bags are whipped; lips are sewn shut; men are equipped; and the lifelines, the lifelines are cut; the cycle is ending yet we keep pretending; and blending and spending 'till we drown out the sea; the furnace is burning, the furnace is churning out;", reps: 3),
    SongProgression.create(progression: progression_2, tag: "Verse 4", lyrics: "the furnace is churning out wrought iron bars;", reps: 1),
]

# berceuse pour les pas fins
song = Song.find_by_name("Berceuse pour les Pas Fins")

progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
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

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "Crève mon sale, t'es un mangeux de marde; Un maudit crotté, un malade mental; M'as te faire poignarder; Tu mériterais de te faire passer; Dessus par un char ou un camion à ciment;"),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "Crève mon sale, t'es un pédophile; Un mangeux de crapauds; Tu sens la canisse d'huile; T'es un sniffeux de moppe; Un licheux de poubelle; J'te clouerais la langue dans le front; Pis je te ferais dire \"ananas\";"),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "Crève mon sale, m'as te faire empailler; Pis m'as te tirer dessus; M'as dire à tout le monde que t'aime le fuschia; Tu mériterais juste que je t'arrache les deux yeux; Pis que je les passe dans mon broyeur;"),
    SongProgression.create(progression: progression_1, tag: "Verse 4", lyrics: "Crève mon sale, m'a envoyer mon chien pisser sue ta tombe; Je vais aller te déterrer pour te voir pourrir; Je vais remplir ton trou avec des déchets dangereux; Pis je vais mettre le feu dedans;"),
    SongProgression.create(progression: progression_1, tag: "Verse 5", lyrics: "Crève mon sale...; T'es un maudit écoeurant laid; Pis tu sens le swing; Tu marches comme un canard; Tu t'exprimes mal; Ton linge est même pas beau; Pis ta mère a le cul large; Comme un autobus;"),
]

# my immortal - evanescence
song = Song.find_by(name: "My Immortal")
progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2, sequence: 2),
]
progression_2 = Progression.create(tag: "Pre-Chorus")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 5),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 6),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 7),
]
progression_3 = Progression.create(tag: "Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 1, sequence: 3),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 1, sequence: 4),
]
progression_4 = Progression.create(tag: "Chorus End")
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 1, sequence: 1),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 1, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4, sequence: 3),
]
progression_5 = Progression.create(tag: "Bridge")
progression_5.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 1),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2, sequence: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 3),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 4),
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 2, sequence: 5),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, sequence: 6),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2, sequence: 7),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2, sequence: 8),
]

SongProgression.create(song: song, progression: progression_1, sequence: 1, tag: "Intro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, sequence: 2, tag: "Verse 1", lyrics: "I'm so tired of being here; Suppressed by all my childish fears; And if you have to leave; I wish that you would just leave; 'Cause your presence still lingers here; And it won't leave me alone;", reps: 4)
SongProgression.create(song: song, progression: progression_2, sequence: 3, tag: "Pre-Chorus 1", lyrics: "These wounds won't seem to heal; This pain is just too real; There's just too much that time cannot erase")
SongProgression.create(song: song, progression: progression_3, sequence: 4, tag: "Chorus 1", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears;", reps: 3)
SongProgression.create(song: song, progression: progression_4, sequence: 5, tag: "Chorus 1", lyrics: "And I held your hand through all of these years; But you still have all of me;")
SongProgression.create(song: song, progression: progression_1, sequence: 6, tag: "Post-Chorus 1", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, sequence: 7, tag: "Verse 2", lyrics: "You used to captivate me by your resonating light; Now I'm bound by the life you left behind; Your face, it haunts my once pleasant dreams; Your voice, it chased away all the sanity in me;", reps: 4)
SongProgression.create(song: song, progression: progression_2, sequence: 8, tag: "Pre-Chorus 2", lyrics: "These wounds won't seem to heal; This pain is just too real; There's just too much that time cannot erase")
SongProgression.create(song: song, progression: progression_3, sequence: 9, tag: "Chorus 2", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears;", reps: 3)
SongProgression.create(song: song, progression: progression_4, sequence: 10, tag: "Chorus 2", lyrics: "And I held your hand through all of these years; But you still have all of me;")
SongProgression.create(song: song, progression: progression_5, sequence: 11, tag: "Bridge", lyrics: "I've tried so hard to tell myself that you're gone; But though you're still with me; I've been alone all along;")
SongProgression.create(song: song, progression: progression_4, sequence: 12, tag: "Bridge", lyrics: "")
SongProgression.create(song: song, progression: progression_3, sequence: 13, tag: "Chorus 3", lyrics: "When you cried I'd wipe away all of your tears; When you'd scream I'd fight away all of your fears;", reps: 3)
SongProgression.create(song: song, progression: progression_4, sequence: 14, tag: "Chorus 3", lyrics: "And I held your hand through all of these years; But you still have all of me;")


# toxicity - system of a down

song = Song.find_by(name: "Toxicity")
progression_1 = Progression.create(tag: "Verse")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]
progression_2 = Progression.create(tag: "Chorus")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]
progression_3 = Progression.create(tag: "Post-Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 1),
    ProgressionChord.create(chord: chord__major, degree: 7, duration: 1),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Intro", lyrics: "", reps: 4)
SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "Conversion, software version 7.0; Looking at life through the eyes of a tire hub; Eating seeds as a pastime activity; The toxicity of our city, of our city;", reps: 4)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 1", lyrics: "New, what do you own the world; How do you own disorder, disorder; Now, somewhere between the sacred silence; sacred silence and sleep; Somewhere between the sacred silence and sleep; Disorder, disorder, disorder;", reps: 4)
SongProgression.create(song: song, progression: progression_1, tag: "Pre-Verse 2", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "More wood for their fires, loud neighbours; Flashlight reveries caught in the headlights of a truck; Eating seeds as a pastime activity; The toxicity of our city, of our city;", reps: 4)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 2", lyrics: " New, what do you own the world, How do you own disorder, disorder; Now, somewhere between the sacred silence, sacred silence and sleep; Somewhere between the sacred silence and sleep, Disorder, disorder, disorder;", reps: 4)
SongProgression.create(song: song, progression: progression_3, tag: "Breakdown", lyrics: "", reps: 16)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 3", lyrics: "New, what do you own the world, How do you own disorder; Now, somewhere between the sacred silence, sacred silence and sleep; Somewhere between the sacred silence and sleep, Disorder, disorder, disorder; ", reps: 4)
SongProgression.create(song: song, progression: progression_3, tag: "Ending", lyrics: "", reps: 4)
SongProgression.create(song: song, progression: progression_3, tag: "Ending", lyrics: "When I became the sun, I shone life into the man's hearts, When I became the sun, I shone life into the man's hearts", reps: 4)

# tangled in ropes - holy locust
song = Song.find_by(name: "Tangled in Ropes")
progression_1 = Progression.create(tag: "Riff 1")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
]

progression_3 = Progression.create(tag: "Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 2, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "I'm tangled in ropes, Pulled into the shore; You wash up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "When the tide rolled out, And all was exposed; You found yourself drowning, in currents untold; Here's a sand dollar too, Hard thoughts taking hold; Though a hundred-degree heat he felt took hold", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 1", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_1, tag: "Post-Chorus 1", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "Well the winter came early, and the ocean froze over; You threw your belongings, onto the shoulder; Stole a pair of boots, that could handle the cold; And walked out into the frozen unknown", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 2", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_1, tag: "Post-Chorus 2", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 3", lyrics: "Now I'm tangled in ropes, Pulled into the shore; You washed up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 3", lyrics: "When the tide rolled out, And all was exposed; You found yourself drowning, in currents untold; Here's a sand dollar too, Hard thoughts taking hold; Though a hundred-degree heat he felt took hold", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 3", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_1, tag: "Post-Chorus 3", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 4", lyrics: "Well the winter came early, and the ocean froze over; You threw your belongings, onto the shoulder; Stole a pair of boots, that could handle the cold; And walked out into the frozen unknown", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 4", lyrics: "And mixing your drinks with holy water; Won't cover up sins that are bound to follow; And a laugh made of wax, house made of butter; How they melted that summer, How they melted that summer", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Outro", lyrics: "I'm tangled in ropes, Pulled into the shore; You wash up all heavy, Tired and bored; Had a laugh made of wax, In a house made of butter; How they melted that summer, How they melted that summer", reps: 1)

# frijolero - molotov
song = Song.find_by_name("Frijolero")
progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]
progression_3 = Progression.create(tag: "Chorus")
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_4 = Progression.create(tag: "Chorus alt ending")
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2)
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "Yo ya estoy hasta la madre, de que me pongan sombrero; Escucha entonces cuando digo, no me llames frijolero;", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "Y aunque exista algún respeto, Y no metamos las narices; Nunca inflamos la moneda, Haciendo guerra a otros países", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "Te pagamos con petróleo, E intereses nuestra deuda; Mientras tanto no sabemos, ¿Quién se queda con la feria?;", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "Aunque nos hagan la fama, De que somos vendedores; De la droga que sembramos, Ustedes son consumidores", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 1", lyrics: "Don't call me gringo you fucking beaner; Stay on your side of that goddamn river; Don't call me gringo, you beaner", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 1", lyrics: "No me digas beaner Mr. Puñetero; Te sacaré un susto por racista y culero; No me llames frijolero pinche gringo puñetero", reps: 1)
SongProgression.create(song: song, progression: progression_1, tag: "Solo", lyrics: "", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 3", lyrics: "Now I wish I had a dime for every single time; I've gotten stared down for being in the wrong side of town", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 3", lyrics: "And a rich man I'd be, If I had that kind of chips; Lately I wanna smack the smiles off these racists", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 4", lyrics: "Podrás imaginarte desde afuera ser un mexicano cruzando la frontera; Pensando en tu familia mientras que pasas dejando todo lo tú que conoces atrás", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 4", lyrics: "Si tuvieras tú que esquivar las balas de unos cuantos gringos rancheros; ¿Les seguirás diciendo good for nothing wetbacks si tuvieras tú que empezar de cero?", reps: 1)
SongProgression.create(song: song, progression: progression_2, tag: "Verse 4", lyrics: "Now why don't you look down to where your feet is planted; That U.S. soil that makes you take shit for granted, If not for Santa Ana, just to let you know; That where your feet are planted would be Mexico, Correcto!", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 2", lyrics: "Don't call me gringo you fucking beaner; Stay on your side of that goddamn river; Don't call me gringo, you beaner", reps: 1)
SongProgression.create(song: song, progression: progression_3, tag: "Chorus 2", lyrics: "No me digas beaner Mr. Puñetero; Te sacaré un susto por racista y culero; No me llames frijolero pinche gringo puñetero", reps: 1)
SongProgression.create(song: song, progression: progression_4, tag: "Finale", lyrics: "", reps: 1)

# salgo a la calle 
song = Song.find_by_id(142)
progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 4),
]

song = Song.find_by_id(142)
progression_2 = Progression.create(tag: "Bridge")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "Salgo a la calle para no pensar, pocas cosas me hacen reaccionar; Porque me ahogo en esta realidad, porque me agobia la necesidad; De saber que algo va a cambiar, que no todos los días van a ser igual; No resisto esta rutina d'esta mierda de vida, necesito saber qu'algo va a explotar, algo va a explotar;")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "Porque tengo.. La necesidad necesito saber que algo va a cambiar; voy viviendo sin sentido, este sistema no me deja avanzar; recorriendo a día día, esa ciudad intentando escapar del camino marcado; no volveré a no pelear x4;")
SongProgression.create(song: song, progression: progression_2, tag: "Break", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Break", lyrics: "Machacados por el trabajo, Reducidos por el estado; Controladores por todos lados, defendiendo su norma socia; De esta falsia democracia x4", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "Salgo a la calle para no pensar, pocas cosas me hacen reaccionar; Porque me ahogo en esta realidad, porque me agobia la necesidad; De saber que algo va a cambiar, que no todos los días van a ser igual; No resisto esta rutina d'esta mierda de vida, necesito saber qu'algo va a explotar, algo va a explotar;")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "Porque tengo.. La necesidad necesito saber que algo va a cambiar; voy viviendo sin sentido, este sistema no me deja avanzar; recorriendo a día día, esa ciudad intentando escapar del camino marcado; no volveré a no pelear x4;")

# where is my mind
song = Song.find_by_name('Where is my Mind?')

progression_1 = Progression.create(tag: "Verse")

progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
]

progression_2 = Progression.create(tag: "Chorus")

progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah); Your head will collapse, and there's nothing in it; And you'll ask yourself", reps: 3)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 1", lyrics: "Where is my mind?; Where is my mind?", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 1", lyrics: "Where is my mind?;", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 1", lyrics: "Way out in the water, see it swimmin';", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "I was swimmin' in the Caribbean; Animals were hiding behind the rocks; Except the little fish; Bumped into me, I swear he was trying to talk to me, koi-koi", reps: 3)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 2", lyrics: "Where is my mind?; Where is my mind?", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 2", lyrics: "Where is my mind?;", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 2", lyrics: "Way out in the water, see it swimmin';", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Verse 3", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah); Your head will collapse, and there's nothing in it; And you'll ask yourself", reps: 3)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 3", lyrics: "Where is my mind?; Where is my mind?", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Chorus 3", lyrics: "Where is my mind?;", reps: 2)
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 3", lyrics: "Way out in the water, see it swimmin';", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Outro", lyrics: "", reps: 2)
SongProgression.create(song: song, progression: progression_1, tag: "Outro", lyrics: "With your feet on the air and your head on the ground; Try this trick and spin it, yeah (Yeah);", reps: 2)

# porque te vas

song = Song.find_by_name("Porque te vas")

progression_1 = Progression.create(tag: "Verse")

progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4)
]

progression_2 = Progression.create(tag: "Chorus")

progression_2.progression_chords = [
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

SongProgression.create(song: song, progression: progression_1, tag: "Verse 1", lyrics: "Hoy en mi ventana brilla el sol; Mi corazón, se pone triste contemplando la ciudad; Por que te vas;")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 2", lyrics: "Como cada noche desperté; Pensando en vos, y en mi reloj todas las horas no terminan mas; Por que te vas;")
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 1", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 3", lyrics: "Yo en tu vida solamente fui; Un juego mas, y todo aquello que juraste por mi amor; Lo olvidaras")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 4", lyrics: "Como cada noche desperté; Pensando en vos, y en mi reloj las horas no terminan mas; Por que te vas")
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 2", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 5", lyrics: "Bajo la penumbra de un farol; Se te olvidan, todas las cosas que quedaron por decir; se te olvidan")
SongProgression.create(song: song, progression: progression_1, tag: "Verse 6", lyrics: "Junto a las manillas de un reloj; Esperaran, todas las horas que quedaron por vivir; Esperaran")
SongProgression.create(song: song, progression: progression_2, tag: "Chorus 3", lyrics: "Todas las promesas de mi amor se irán contigo; Lo olvidaras, lo olvidaras; Y en mi habitación te llorare igual que un niño; Por que te vas, por que te vas")

# somewhere over the rainbow

song = Song.find_by_name("Somewhere over the rainbow")

progression_1 = Progression.create(tag: "Intro 1")
progression_1.progression_chords = [
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

progression_2 = Progression.create(tag: "Intro 2")
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 7, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 2, bass_degree: 3),
]

progression_3 = Progression.create(tag: "Verse")
progression_3.progression_chords = [
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

progression_4 = Progression.create(tag: "Chorus", reps: 2)
progression_4.progression_chords = [
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 7, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 3, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 1, duration: 4),
]

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "");
SongProgression.create(song: song, progression: progression_2, tag: "Intro", lyrics: "");
SongProgression.create(song: song, progression: progression_3, tag: "Verse 1", lyrics: "Somewhere over the rainbow, way up high; And the dreams that you dream, once in a lullaby");
SongProgression.create(song: song, progression: progression_3, tag: "Verse 2", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dream of, dreams really do come true. Ohhhh.");
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 1", lyrics: "Someday I'll wish upon a star, wake up where the clouds are far behind me; Where troubles melts like lemon drops, high above the chimney tops; that's where you'll find me, oh ");
SongProgression.create(song: song, progression: progression_3, tag: "Verse 3", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dare to, oh, why, oh why can't I? I-I-I, oh");
SongProgression.create(song: song, progression: progression_4, tag: "Chorus 2", lyrics: "Someday I'll wish upon a star, wake up where the clouds are far behind me; Where troubles melts like lemon drops, high above the chimney tops; that's where you'll find me, oh ");
SongProgression.create(song: song, progression: progression_3, tag: "Verse 4", lyrics: "Somewhere over the rainbow bluebirds fly; and the dreams that you dare to, oh, why, oh why can't I? I-I-I, oh");
SongProgression.create(song: song, progression: progression_2, tag: "Outro", lyrics: "");

# california dreamin'

song = Song.find_by_name("California Dreamin'")

progression_1 = Progression.create(tag: "Intro")
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 2),
    ProgressionChord.create(chord: chord__suspended_fourth, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__double_suspended, degree: 1, duration: 2),
]

progression_2 = Progression.create(tag: "Verse")
progression_2.progression_chords = [
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

progression_3 = Progression.create(tag: 'Solo')
progression_3.progression_chords = [
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

progression_4 = Progression.create(tag: "Final verse")
progression_4.progression_chords = [
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

SongProgression.create(song: song, progression: progression_1, tag: "Intro", lyrics: "")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 1", lyrics: "All the leaves are brown (All the leaves are brown); And the sky is gray (And the sky is gray); I've been for a walk (I've been for a walk); On a winter's day (On a winter's day); I'd be safe and warm (I'd be safe and warm); If I was in L.A. (If I was in L.A.); California dreamin' (California dreamin'); On such a winter's day;")
SongProgression.create(song: song, progression: progression_2, tag: "Verse 2", lyrics: "Stopped in to a church; I passed along the way; Well, I got down on my knees (Got down on my knees); And I pretend to pray (I pretend to pray); You know the preacher liked the cold (Preacher liked the cold); He knows I'm gonna stay (Knows I'm gonna stay); California dreamin' (California dreamin'); On such a winter's day")
SongProgression.create(song: song, progression: progression_3, tag: "Solo", lyrics: "")
SongProgression.create(song: song, progression: progression_4, tag: "Verse 3", lyrics: "All the leaves are brown (All the leaves are brown); And the sky is gray (And the sky is gray); I've been for a walk (I've been for a walk); On a winter's day (On a winter's day); If I didn't tell her (If I didn't tell her); I could leave today (I could leave today); California dreamin' (California dreamin'); On such a winter's day;")

# careless whisper
song = Song.find_by_name("Careless Whisper")

progression_1 = Progression.create(tag: "Intro", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__major, degree: 3, duration: 2),
]

progression_2 = Progression.create(tag: "Verse", reps: 2)
progression_2.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

progression_3 = Progression.create(tag: "Chorus", reps: 3)
progression_3.progression_chords = [
    ProgressionChord.create(chord: chord__minor, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__minor, degree: 4, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 6, duration: 4),
    ProgressionChord.create(chord: chord__major, degree: 5, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Intro", lyrics: ""),
    SongProgression.create(progression: progression_2, tag: "Verse 1", lyrics: "I feel so unsure, As I take your hand and lead you to the dance floor; As the music dies, Something in your eyes; Calls to mind a silver screen, And all of its sad goodbyes;"),
    SongProgression.create(progression: progression_3, tag: "Chorus 1", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    SongProgression.create(progression: progression_2, tag: "Verse 2", lyrics: "Time can never mend, The careless whispers of a good friend; To the heart and mind, Ignorance is kind; There's no comfort in the truth, Pain is all you'll find"),
    SongProgression.create(progression: progression_3, tag: "Chorus 2", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    SongProgression.create(progression: progression_2, tag: "Bridge", lyrics: "Tonight the music seems so loud, I wish that we could lose this crowd; Maybe it's better this way, We'd hurt each other with the things we want to say; We could have been so good together, We could have lived this dance forever; Now who's gonna dance with me... Play stay"),
    SongProgression.create(progression: progression_3, tag: "Chorus 3", lyrics: "I'm never gonna dance again, These guilty feet have got no rhythm; Though it's easy to pretend, I know you're not a fool; I should've known better than to cheat a friend, And waste the chance that I'd been given; So I'm never gonna dance again...; The way I danced with you"),
    SongProgression.create(progression: progression_2, tag: "Outro", lyrics: ""),
]

# ram ranch
# song = Song.find_by_name("Ram Ranch")

# caca en la cabeza
song = Song.find_by_name("Caca en la cabeza")

progression_1 = Progression.create(tag: "Verse", reps: 2)
progression_1.progression_chords = [
    ProgressionChord.create(chord: chord__minor_seventh, degree: 1, duration: 4),
    ProgressionChord.create(chord: chord__seventh, degree: 6, duration: 2),
    ProgressionChord.create(chord: chord__seventh, degree: 5, duration: 2),
]

song.song_progressions = [
    SongProgression.create(progression: progression_1, tag: "Verse 1", lyrics: "Mi primer alimento fue leche materna, me enchufaron nesquik como cosa buena; Yogures Petit me compraba mi abuela, Serenito, Yimmy, postrecitos de mierda; Mc Donalds, Burguer King, chatarra por las venas, Recuerdo Pumper Nic con sus puertas abiertas; ofreciéndome a mí cajitas y sorpresas, y hoy al fin comprendí que su comida apesta;", reps: 2),
    SongProgression.create(progression: progression_1, tag: "Verse 2", lyrics: "Chicle pa' masticar y arruinarme las muelas, Bebida oscurita con su roja etiqueta; queriéndome engañar de ofertas navideñas, Ya no te compro más, tus anuncios: mi ofensa.; Hoy día puedes comprar arroz, trigo y lenteja, Hay verdura a granel de transgénicas huertas; Te sugiero también del agua estés alerta, y comienza a poner en tus frascos reservas; Rebobinando atrás, hombre de las cavernas no bebía champán; ni cuidaban sus prendas, poco eran de hablar, y asombrados de estrellas, tocaban música con ramitas y piedras", reps: 2 ),
    SongProgression.create(progression: progression_1, tag: "Chorus 1", lyrics: "Creo que hay que volver a las antiguas eras, de muerte natural, sin remedio ni queja; y ojalá que mañana cuando amanezca, me coma un dinosaurio y se acabe mi pena" ),
    SongProgression.create(progression: progression_1, tag: "Verse 3", lyrics: "La vaquita está muerta y ya nadie la respeta, pobrecita ya sufrió y le comen la molleja; su lengüita mascó pasto de pradera, y su leche la dio, no esperó recompensa; Lo mismo que un pollo que crece entre maderas, que le inyectan hormonas pa' que gordo parezca; ¿Qué tan rico será un humano en bandeja? rostizado quizá no nos demos ni cuenta", reps: 2 ),
    SongProgression.create(progression: progression_1, tag: "Verse 4", lyrics: "Si escupimos pa' arriba nos cae en la geta, Si miramos tv: caca en nuestras cabezas; No nos enseñan bien, (en la escuela te inventan y te enferman); Transmitir el saber de boquita en oreja", reps: 1 ),
    SongProgression.create(progression: progression_1, tag: "Chorus 2", lyrics: "Creo que hay que volver a las antiguas eras, de muerte natural, sin remedio ni queja; y ojalá que mañana cuando amanezca, me coma un dinosaurio y se acabe mi pena", reps: 1 ),
]