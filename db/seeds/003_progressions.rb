# shortcuts
chord__major = Chord.find_by(name: "Major Triad")
chord__minor = Chord.find_by(name: "Minor Triad")

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
song = Song.find(4)
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

# devil's wlil - cousin boneless
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
SongProgression.create(song: song, progression: progression_2, sequence: 4, tag: "Chorus", lyrics: "So come with me, I've got a story to tell")
SongProgression.create(song: song, progression: progression_2, sequence: 5, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell")
SongProgression.create(song: song, progression: progression_1, sequence: 6, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 7, tag: "Verse 2", lyrics: "Tonight I'll feast with the feral beasts; With heavy breath and sharpened teeth; Keep the bones, savor the meat")
SongProgression.create(song: song, progression: progression_1, sequence: 8, tag: "Verse 2", lyrics: "Our glasses clink with the Devil's drink; In a raised whiskey bottle we all will sink; And we'll find, what the Devil thinks")
SongProgression.create(song: song, progression: progression_2, sequence: 9, tag: "Chorus", lyrics: "So come with me, I've got a story to tell")
SongProgression.create(song: song, progression: progression_2, sequence: 10, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell")
SongProgression.create(song: song, progression: progression_1, sequence: 11, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 12, tag: "Verse 3", lyrics: "Tonight I'll dance in the Devil's fire; Throw myself in, add to the pyre; To admire, so much to desire")
SongProgression.create(song: song, progression: progression_1, sequence: 13, tag: "Verse 3", lyrics: "Tonight I'll sleep by the Devil's cheek; As she culls with a lullaby so sweet; How unique, how the serpent speaks")
SongProgression.create(song: song, progression: progression_2, sequence: 14, tag: "Chorus", lyrics: "So come with me, I've got a story to tell")
SongProgression.create(song: song, progression: progression_2, sequence: 15, tag: "Chorus", lyrics: "And if we dig real deep I bet we can reach hell")
SongProgression.create(song: song, progression: progression_1, sequence: 16, tag: "Break", lyrics: "")
SongProgression.create(song: song, progression: progression_1, sequence: 17, tag: "Verse 3", lyrics: "Tonight we'll fulfill the Devil's will; Sign fine lines with a bloody quill; What was killed, well it suffers still")
SongProgression.create(song: song, progression: progression_2, sequence: 18, tag: "Chorus B", lyrics: "So come with us, we've got so much to tell")
SongProgression.create(song: song, progression: progression_2, sequence: 19, tag: "Chorus B", lyrics: "And if we dig real deep I bet we can reach hell")

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

