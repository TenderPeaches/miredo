# README

A locally-hosted web Ruby on Rails app that catalogs songs chords and lyrics. Features visual aids to help situating the musical scales of a given song on a guitar fretboard and piano keys. Keeps track of when/how many times each song is played, if the goal is to practice them. <br>

Ruby v3.1.3<br>
Rails v7.0.5<br>

Run bin/rails s<br>
Access 127.0.0.1:3000 on your browser<br>

See seeds.rb for template to add new songs<br>

# MIREDO

Miredo is meant to be a dynamic songbook reference, meant to accomodate musical novices and amateurs while being useful to anyone who wishes to play their own songs or practice playing covers of existing pieces.

Miredo is meant to describe the broad chord progressions of any submitted songs. Solos, riffs and other intricate techniques are left up to the artist to improvise. Likewise, the exact timing of bars and lyrics is left up to the user; it is assumed that they are able to listen to the song and figure it out. 

Songs are presented in their original suggested key but the user may adjust the key according to their personal or musical preferences.

# Home page
From here, you may browse all public songs as well as any of your own private contributions. Use the options at the top to filter and sort the list. 

According to your settings, each song may appear in a different color depending on the last time it was played by your user account. 

Default color codes:
    Purple: Last practice was played without any visual aids (by heart)
    Green: Last practice was recent
    Yellow: Last practice was a bit less recent
    Orange: Last practice was even less recent
    Red: Last practice was a while back
    None: Last practice was too long ago

By clicking the name of the song, you are taken to its songbook entry.
By clicking the "Play" button, you are telling the application that you just finished playing/practicing this song.
By clicking the "Play+" button, you are telling the application that you just finished playing/practicing this song but without needing any visual or memory aids. 

# Creating songs

First set the song's attributes:
    Name of the song
    Position in Album
    Approximate duration, in seconds
    Whether the song can be seen by anyone or not
    Suggested capo placement
    Defaut song key @ https://en.wikipedia.org/wiki/Key_(music)
    Default song scale @ https://en.wikipedia.org/wiki/Scale_(music)
    Artist who originally wrote the song

Now, the song exists. You must define the progression templates - the building blocks that will be used to assign chords to each part of the song. Go to "Set Progressions"

A progression template is mainly defined by a progression of chords. For instance, C-F-Am-G- is a progression in the key of C major. Progression chords are defined as degrees relative to the key, so the progression can be shifted to use any given key. 

For each progression template, you must set:
    A tag to label the template - like Verse, Intro, Chorus, Bridge, etc.
    Reps: how many times the pattern repeats itself, defaults to 1
    A chord pattern cypher, like "C--F--Am--G--"

The application interprets the cypher to extract *progression chords*, which together build up any given progression. Each progression chord consists of:
    A degree relative to the song's key, given a scale. The degree is interpreted from the chord letter and sharps/flats (C, D, F#, etc)
    A duration number - an integer that matches the number of dashes that follow the chord letter. For instance, "C----" is a C-chord of duration 4. Duration is meant to be a generic, abstract measure of time although it will usually match up with the each beat of a song. For instance, "C---F---G------" is assumed to be in 3/4, whereas something like "C----F----G----Am----" would be assumed to be 4/4.
    A chord type, extrapolated from the cypher using the standard chord notations. For instance, "Am" will be interpreted as a Minor chord. 
    A modifier, because some times off-key chords can occur. The modifier is an integer that is added to the degree of a chord, for instance in the Major Scale in the key of C, F# can be thought of as the Major Fourth with a modifier of 1 (F + 1 => F#) or the Major Fifth with a modifier of -1 (G - 1 => Gb). 
    A bass note, as sometimes chords are played with a different bass note than the root.
    A bass note modifier, in case the bass note is not in the scale with the given key

Once the progression templates have been set up, you are ready to define the Song Structure by creating progressions out of the progression templates. A progression consists of:
    A progression template, which defines what chords are played and how throughout the progression
    A tag, which defines the specific role of this progression. Whereas progression template tags will be more generic (Verse, Chorus, Bridge, etc.), progression tags must define a single block of the song, for instance: Verse 1, Chorus 2, Pre-Chorus 3. Still, the progression tag might sometimes match the progression template tag exactly, for templates that only occur once in a song like typically the Intro, Outro, Bridge, etc.
    A "reps" value, for how often the template gets repeated. This value is compounded with the template's own "reps" value, meaning a template with a reps of 2 being used by a progression with a reps of 6 will need to be played a total of 12 times during the progression.
    A block of lyrics that are sung over the progression. Place back-vocals in parenthesis. Semi-columns are replaced by new lines.
    A custom key and scale, if the progression uses different values than the song