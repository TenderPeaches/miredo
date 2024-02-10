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
            @song.song_progressions.order(:sequence).each do |song_progression|
                # how many lines expected?
                # because all numbers are >= 0, this bit rounds up without converting to float and rounding up
                # https://stackoverflow.com/questions/32144781/can-integer-division-be-rounded-up-instead-of-down
                line_count = ((song_progression.duration + chord_ticks_per_line - 1) / chord_ticks_per_line)

                # to track tick longitude 
                tick_counter = 0

                song_progression.progression.progression_chords.order(:sequence).each do |progression_chord|
                    tick_counter += progression_chord.duration
                    if tick_counter > chord_ticks_per_line
                        @output << "</br>"
                        tick_counter -= chord_ticks_per_line 
                    end
                    #! business logic shuold be out of progression_chord
                    @output << progression_chord.print_with_colors(@key, @scale)
                end
                if song_progression.show_reps?
                    @output << song_progression.print_reps 
                end 
                unless song_progression.lyrics.nil? || song_progression.lyrics.empty?
                    @output << "</br>"
                    @output << song_progression.html_lyrics
                    @output << "</br>"
                end
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