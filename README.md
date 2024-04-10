# README

A locally-hosted web Ruby on Rails app that catalogs songs chords and lyrics. Features visual aids to help situating the musical scales of a given song on a guitar fretboard and piano keys. Keeps track of when/how many times each song is played, if the goal is to practice them. <br>

Ruby v3.1.3<br>
Rails v7.0.5<br>

Run bin/rails s<br>
Access 127.0.0.1:3000 on your browser<br>

See seeds.rb for template to add new songs<br>

# MIREDO

Miredo is meant to be a dynamic songbook, meant to accomodate musical novices and amateurs while being useful to any who wish to play their own songs or practice covers of existing pieces.

It is meant to describe the broad chord progressions of any submitted songs. Solos, riffs and other intricate techniques are left up to the artist to improvise. Songs are presented in their original suggested key but the user may adjust the key according to their own whims.

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
    A chord pattern

For each chord in the chord pattern, you must set:
    A degree, relative to the key tonic
    A duration, an arbitrary unit of time that represents how long the chord is sustained
    

