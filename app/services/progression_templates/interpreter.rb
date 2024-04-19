module ProgressionTemplates
    class Interpreter
        def initialize(key, scale)
            @key = key
            @scale = scale
        end

        # interpret a cypher to create a progression chord
        def from_cypher(cypher)
            # remove white spaces and look for the progression chord patterns
            regexp = /([ABCDEFG][#b]?(#{Chord.regex_selector})?(\/[ABCDEFG][#b]?)?[\u2013.x\-]*)/
=begin
            regexp = /
                ([ABCDEFG]                  # pitch class
                [#b]?                       # flat or sharp modifier
                [#{Chord.regex_selector}]?  # chord modifiers like m, sus4, dim, 7, etc.
                ([\/]                       # slash for bass notes
                [ABCDEFG][#b]?)+?           # bass note pitch class with optional sharp or flat, use lazy quantifier otherwise the slash fucks things up
                [–.x\-]*                    # duration markers, keep dash to the right to avoid open range errors
                )/
=end
            # if cypher isn't a string, check to see if it's an object that contains a cypher
            unless cypher.is_a? String
                if cypher.cypher&.is_a? String
                    cypher = cypher.cypher
                end
            end
            # remove all whitespace and find progression chord patterns in the cypher
            progression_chord_cyphers = cypher.gsub(/\s+/, "").scan(regexp)

            # compile two sets:
            # the valid progression chords gleaned from the cypher
            progression_chords = []
            # the invalid parts of the cypher
            invalid_cyphers = []

            # interpreter for each individual progression chord
            progression_chord_interpreter = ProgressionChords::Interpreter.new(@key, @scale)

            progression_chord_cyphers.each_with_index do |progression_chord_cypher, i|
                # try to determine all the progression chord attributes from the cypher bit that matches a progression chord pattern
                progression_chord_result = progression_chord_interpreter.from_cypher(progression_chord_cypher)

                # add to the appropriate set depending on whether or not the cypher correctly translated to a progression chord
                if progression_chord_result.valid?
                    progression_chords << progression_chord_result.progression_chord
                    progression_chords.last.sequence = i + 1
                else
                    invalid_cyphers << progression_chord_result.cypher
                end
            end

            # send out the result
            Result.new(progression_chords, cypher, invalid_cyphers)
        end

        # interpret a set of progression chord to create a cypher
        def to_cypher(progression_chords)
            cypher = ""
            progression_chord_interpreter = ProgressionChords::Interpreter.new(@key, @scale)

            # print each chord's cypher sequentially
            progression_chords.each do |progression_chord|
                cypher << progression_chord_interpreter.to_cypher(progression_chord).cypher
            end

            Result.new(progression_chords, cypher)
        end

        class Result
            attr_reader :progression_chords, :cypher, :invalid_cyphers
            def initialize(progression_chords, cypher, invalid_cyphers = [])
                @progression_chords = progression_chords
                @cypher = cypher
                @invalid_cyphers = invalid_cyphers
            end

            def valid?
                @invalid_cyphers.empty?
            end

            def errors
                @invalid_cyphers
            end
        end
    end
end
