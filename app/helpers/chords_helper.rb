module ChordsHelper
    # outputs a chord's intervals as both the classic interval notation and the actual semitones intervals between each component of the chord, like so:
    # P1 M3 M5 (0 4 7)
    def chord_intervals(chord)
        chord_intervals_notation = []
        chord_semitones_notation = []

        chord.chord_components.each do |chord_component|
            chord_intervals_notation << chord_component.interval_quality.shorthand + chord_component.interval.shorthand

            chord_semitones_notation << chord_component.interval.semitones + chord_component.interval_quality.modifier
        end

        chord_intervals_notation = chord_intervals_notation.join " "
        chord_semitones_notation = chord_semitones_notation.join "-"

        "#{chord_intervals_notation} (#{chord_semitones_notation})"
    end

    # accepts an array of PitchScales, print as notes
    def print_chord_notes(notes)
        output = ""

        notes.each do |note|
            output << "#{note.letter} "
        end

        output
    end

    # header row for the chords reference table
    def chords_reference_header
        tag.div class: "table-header chords-reference-header" do
            safe_join [
                tag.span(Chord.human_attribute_name(:name)),
                tag.span(Chord.human_attribute_name(:notation)),
                tag.span(Interval.model_name.human.pluralize),
                tag.span(t('music_theory.semitone').pluralize),
            ]
        end
    end
end
