# Quick and dirty sales pitch
Miredo is a song-tabbing web app meant to help amateur songwriters and musicians catalog their repertoire. It aims to be accessible to those without a music theory background, while using basic music theory concepts to assist the user into developing their craft.

# root_path
Log in to access your private songs, to view your playing stats and to modify the songs you are responsible for.

Basic, to-be-expanded filters and sorting options, as well as visual aids, help document practice habits and make up for subjective playing tendencies.

One way I use this is to glean at the names and try to play them by heart. There's a play+ button, which you can access here directly. Play+ means you played the song without looking at the lyrics or chords - you're ready to play it live!

# show_song
See the song info, your practice info, then adjust the key if you wish to. Try and play with, without capo.

Helpers aid in navigating the scales' intervals on your instrument. Right now, it is set only to piano and guitar. Similar stringed instruments like banjo, mandolin, etc. will be relatively trivial to implement.

For both the piano and the guitar, colored keys and fretted strings correspond to a degree in the scale, shown in the table to the left. Different color presets will be a setting. Using colors, it becomes easier to glean where your tonic is on the fretboard if you're looking for red, rather than having to read out the letters and symbols.

Then, the songs' progressions are displayed in sequence. Chord progressions are summarily placed above the lyrics that are played throughout. The complexity of implementing fixed anchor points for each individual chord is not deemed a good tradeoff. With the chords at least written down and the song playing in their ear, the user should have no issue finding those anchor points themselves. Sorry to potential deaf users :/

# progression_templates
The magic behind the scenes occurs through Progressions, which are instanciations of a ProgressionTemplate. 

First, the template defines a sequence of chords (progression chords), repeated a number of time ("reps"), whose key and scale might sometimes differ from the song's main key and scale. Each template has its own tag - typically, these tags will be as generic as possible: "Verse", "Intro", "Chorus", "Bridge", etc.

The progression chord is perhaps the meatiest part of the process, given the potential variety. For each progression chord, we need: the degree relative to the tonic, any additional interval to allow for dissonant chords (that are not in the key), the chord type (major, minor, seventh, suspended fourth, etc.), the bass note (also as a degree relative to the tonic and an additional interval to allow for dissonant bass notes), a relative duration (usually implied as the number of beats) and modifiers (muted, staccato, faster, slower, etc.)

Rather than using a meaty form for each one, Miredo uses a cypher-like text field, where the user can submit chords according to specific guidelines. An interpreter translates this cypher into chords, which are then evaluated against the song's key and scale to be built as ProgressionChords.

This avoids requiring the user to consider any of the theoretical aspects behind the chords. To enter a simple I-V-IV-V progression, they can pick the key of C and enter "C-G-F-G-". 

Then, the user must define the song progressions using the templates as building blocks. Reps of a progresison are multiplicative with the templates' reps, so a progression with reps 2 that uses template with reps 3 will be repeated 6 times. Instrumental progressions have empty lyrics. Like with templates, individual progressions within the song can have a different key and scale. This allows for avoiding duplication when defining chord patterns that remain the same but that go up or down a few keys. 