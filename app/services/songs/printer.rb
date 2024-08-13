module Songs
    class Printer

        attr_accessor :key, :scale, :song, :capo

        def initialize(song, key, scale, capo)
            @song = song
            @key = key
            @scale = scale
            @capo = capo
        end

        def print
            @output = ""
            @current_tag = nil
            # go one song progression at a time
            @song.progressions.order(:sequence).each do |progression|

                # to track tick longitude
                tick_counter = 0

                # loop over song progression chords in sequential order
                progression.progression_template.progression_chords.order(:sequence).each do |progression_chord|

                    # print the progression tag if it isn't the same as the previous progression's
                    @output << print_tag(progression, @current_tag)
                    @current_tag = progression.tag

                    # increase tick counter for however long the chord lasts
                    tick_counter += progression_chord.duration

                    # if tick counter overflows the line's length, reset it and add a new line
                    if tick_counter > chord_ticks_per_line
                        @output << "<br/>"
                        tick_counter -= chord_ticks_per_line
                    end
                    # print the colored chord & duration notches
                    @output << progression_chord.print_with_colors(progression.effective_key(@capo * -1), progression.effective_scale)
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

        def print_tag progression, current_tag
            if progression.tag != current_tag
                "<div class=\"progression-tag\">#{progression.tag}</div>"
            else
                ""
            end
        end
    end
end
