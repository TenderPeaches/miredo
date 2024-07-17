## Progression chords can infer some amount of information that isn't explicitly defined, especially in the context of a song progression. The ProgressionChords Analyzer helps extract this information, depending on a given context
module ProgressionChords
    class Analyzer
        def initialize(progression, progression_chord)
            @progression = progression
            @progression_chord = progression_chord
        end
    end
end
