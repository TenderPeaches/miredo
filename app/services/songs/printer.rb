module Songs
    class Printer

        attr_accessor :key, :scale, :song

        def initialize(song, key, scale)
            @song = song
            @key = key
            @scale = scale
        end

        def print
            @output = ""
            # go one song progression at a time
            @song.progressions.order(:sequence).each do |progression|
                # how many lines expected?
                # because all numbers are >= 0, this bit rounds up without converting to float and rounding up
                # https://stackoverflow.com/questions/32144781/can-integer-division-be-rounded-up-instead-of-down
                line_count = ((progression.duration + chord_ticks_per_line - 1) / chord_ticks_per_line)

                # to track tick longitude
                tick_counter = 0

                # loop over song progression chords in sequential order
                progression.progression_template.progression_chords.order(:sequence).each do |progression_chord|
                    # increase tick counter for however long the chord lasts
                    tick_counter += progression_chord.duration

                    # if tick counter overflows the line's length, reset it and add a new line
                    if tick_counter > chord_ticks_per_line
                        @output << "<br/>"
                        tick_counter -= chord_ticks_per_line
                    end
                    # print the colored chord & duration notches
                    @output << progression_chord.print_with_colors(@key, @scale)
                end

                # only show reps if there are more than 1
                if progression.show_reps?
                    # print x4 or however many reps
                    @output << progression.print_reps
                end

                # if there are some lyrics
                unless progression.lyrics.nil? || progression.lyrics.empty?
                    @output << "<br/>"
                    @output << progression.html_lyrics
                end

                # add trailing white line
                @output << "<br/>"
            end

            return @output.html_safe
        end

        private
        def chord_ticks_per_line
            # todo find a way to adjust this to screen display... or come up with better idea for display
            @chord_ticks_per_line = 16
        end
    end
end
