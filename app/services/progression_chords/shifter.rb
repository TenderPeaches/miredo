module ProgressionChords
    class Shifter
        def initialize(progression_chord)
            @progression_chord = progression_chord
        end

        # the shift is the number of positions that this progression chord should move over; a 1 shift has a progression chord switch places with the next progression chord
        def shift(shift = 1)
            negative_shift = shift < 0
            step = negative_shift ? -1 : 1
            shifted_positions = 0

            # swap however many times by adjusting each progression chord's sequence number
            shift.abs.times do |i|
                swapped_chord = ProgressionChord.where(progression_template: @progression_chord.progression_template, sequence: @progression_chord.sequence + step).first

                # if not found, assume end (or beginning) of sequence has been reached so break out of the loop
                if swapped_chord.nil?
                    break
                end

                # to swap, step the original chord one way
                @progression_chord.sequence += step
                # step the other chord (whose sequence now conflicts with @progression_chord) the other way (to occupy the sequence slot that was left vacant by @progression_chord shifting this way)
                swapped_chord.update(sequence: swapped_chord.sequence + (step * -1))

                # keep track
                shifted_positions += step
            end

            # save @progression_chord at the end of everything
            @progression_chord.save

            Result.new(@progression_chord, step)
        end

        class Result
            attr_reader :progression_chord, :step
            def initialize(progression_chord, step)
                @progression_chord = progression_chord
                @step = step
            end

            def stepped_any?
                step != 0
            end
        end
    end
end
