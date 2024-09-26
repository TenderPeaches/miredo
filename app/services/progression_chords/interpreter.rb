module ProgressionChords
    ##
    # to translate to and from easily legible progression chord cyphers
    # for instance, rather than defining a progresison chord as "1st degree+1 minor chord with bass note of 5th degree+1 for 4 beats", the user could instead simply input a plain string "C#m/G#----" and leave it to the program to translate that into a ProgressionChord
    class Interpreter
        def initialize(key, scale)
            @key = key
            @scale = scale
        end

        # interpret a cypher to create a progression chord
        # due to how regexes work, the cypher argument here is an array, where:
        # cypher[0] contains the cypher's actual string
        # cypher[1] contains the chord type notation (m, 7, etc)
        # cypher[2] contains the part of the cypher that contains the bass note
        # see regex used in ProgressionTemplates::Interpreter to confirm
        def from_cypher(cypher)
            progression_chord = ProgressionChord.new

            # if there's a nil, raise an error
            if cypher.nil? || cypher[0].nil?
                raise "Trying to decypher nil"
            end

            # extract the pitch class and assess where it fits within the scale, given the key
            pitch_class = extract_pitch_class_from_cypher cypher[0]
            evaluator = Evaluator.new(@key, @scale)
            evaluated_degree = evaluator.evaluate(pitch_class)

            # set the progression chords' attributes accordingly
            progression_chord.degree = evaluated_degree.degree
            progression_chord.modifier = evaluated_degree.modifier

            # extract the bass note's pitch class, do the same as with the main pitch class, if present
            if cypher[2]
                bass_pitch_class = extract_pitch_class_from_cypher cypher[2]
                evaluated_bass_degree = evaluator.evaluate(bass_pitch_class)

                progression_chord.bass_degree = evaluated_bass_degree.degree
                progression_chord.bass_modifier = evaluated_bass_degree.modifier
            end

            progression_chord.duration = extract_duration(cypher[0])
            progression_chord.staccato = extract_staccato(cypher[0])
            progression_chord.muted = extract_muted(cypher[0])

            # need to regex capture this as a group to make it easier
            progression_chord.chord = Chord.find_by_notation(cypher[1] || "")

            #todo extract options (staccato, mute, etc.)

            FromCypherResult.new(progression_chord, cypher, [])
        end

        # interpret a progression chord to create a cypher
        def to_cypher(progression_chord, print_duration: true)

            # main chord & sharp/flat symbol
            cypher = progression_chord.print_chord(@key, @scale)

            # bass note if present
            if progression_chord.bass_degree
                # the position of the bass note is the key's pitch class + bass degree's interval + the bass-specific modifier, within [0,11]
                bass_pitch_class_position = (@key.pitch_class.position + @scale.get_degrees_interval(progression_chord.bass_degree) + progression_chord.bass_modifier) % 12

                # 0th position is really 12th
                bass_pitch_class_position = 12 if bass_pitch_class_position == 0

                # print the bass note
                cypher << "/" << PitchClass.find_by_position(bass_pitch_class_position).print
            end

            if print_duration
                # print the duration
                (progression_chord.duration - 1).times do |i|
                    # separate beats by groups of 4 by prepending a space on the 5th, 9th, 13th, etc. beats
                    #todo could be set according to the song's time signature, for 3/4, etc.
                    if i > 0 && (i - 1) % 4 == 0
                        cypher << " "
                    end

                    beat_marker = if progression_chord.staccato
                        beat_marker = "."
                    elsif progression_chord.muted
                        beat_marker = "x"
                    else
                        beat_marker = "-"
                    end

                    cypher << beat_marker
                end
            end

            # spacing at the end
            cypher << " "

            ToCypherResult.new(progression_chord, cypher)
        end

        private

        class ToCypherResult
            attr_reader :cypher
            def initialize(progression_chord, cypher)
                @progression_chord = progression_chord
                @cypher = cypher
            end
        end

        class FromCypherResult
            attr_reader :progression_chord
            def initialize(progression_chord, cypher, initial_cypher)
                @progression_chord = progression_chord
                @cypher = cypher
            end

            def valid?
                !@progression_chord.nil?
            end
        end

        def extract_pitch_class_from_cypher(cypher)
            # assess degree by assessing interval between cypher pitch class & key tonic
            cypher_pitch_class_match = cypher.match(/([ABCDEFG])([#b]?)/)

            if cypher_pitch_class_match.nil?
                nil
            else
                # find the natural pitch class
                natural_pitch_class = PitchClass.find_by_letter(cypher_pitch_class_match[1])

                # adjust depending on if the cypher contiained a flat (b) or sharp (#)
                if cypher_pitch_class_match[2].empty?
                    natural_pitch_class
                else
                    # if sharp, offset by one
                    if cypher_pitch_class_match[2] == "#"
                        natural_pitch_class.next
                    # otherwise assume flat, offset by minus one
                    else
                        natural_pitch_class.previous
                    end
                end
            end
        end

        #! the chord itself is a duration marker
        def extract_duration(cypher)
            duration_marks = cypher.gsub(/\s+/, "").match(/[-–.x]+/)

            if duration_marks
                # count the marks, with each = 1 duration, + 1 for the chord
                duration_marks.match(0).size + 1
            else
                # 1 for the chord
                1
            end
        end

        def extract_staccato(cypher)
            cypher.match(/[.]+/).present?
        end

        #! repetition markers aren't a thing yet, but if they ever are this might conflict
        def extract_muted(cypher)
            cypher.match(/[x]+/).present?
        end
    end
end
