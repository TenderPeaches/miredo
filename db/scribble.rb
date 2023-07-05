# when breaking a song donw into its most basic parts, consider:

# SEQUENCE> A part of a song that shares the same Key and BPM
    # most songs should be assumed to be single-sequenced for now but it's good to keep this in mind if more complex song structures are to be implemented at some point
    # BPM> beats per minute
    # KEY> key for this sequence; for a single-sequence song, key of the song too
    # PATTERNS> chord patterns, implemented as generic chords: Minor 5th, etc etc. so that in the end, if it's Am, it's shown as Am
        # CHORD> as Degree so I, i, i7, idim, i6, etc. using SEQUENCE.KEY to determine the final chord that is being played so if I in C then play C
        # PATTERN_CHORD> a chord as part of a pattern, has a duration (in beats) and a sequence number; there should be checks in the model when pattern chords are modified
    # LICKS> or melodies; patterns that are based on notes
    # LYRICS> text that goes alongside the sequence, can match some chord patterns
    # SONG_PATTERNS> of the patterns that exist, which order are they in
    # SONG_LYRICS> of the lyrics that exist, which order are they in

#? Patterns => Song-specific or not? Right now it's not even enforced, so same patterns *could* be reused, with this in mind might as well consider patterns reusable, in which case it doesn't make all that much sense to give each pattern a tag; instead, the tag should be in song_patterns and there should just been generic tags generated for patterns that are already associated with a given song through song_progressions
