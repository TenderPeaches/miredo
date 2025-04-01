module InstrumentViewsHelper

    def instrument_view_tag(instrument_view, &block)

        tag.div class: "#{instrument_view.instrument.instrument_template.filename.kebabcase}-view#{instrument_view.instrument.instrument_template.has_fretboard? ? " fretted-instrument" : ""}" do
            capture(&block)
        end
    end

    ## draws a fret (for a single string, not the actual neck-width fret) for a fretted instrument, given:
    # @open_pitch => TuningPitch of the open string under the fret
    # @fret => draw the nth fret
    # @capo => assume capo at nth position
    # @accepted_pitch_ids => Pitch IDs that should be highlighted somehow
    def fretted_instrument_fret(open_pitch, fret, instrument_view)

        # set the capo if necessary
        capo = instrument_view.capo_relative_pitches ? 0 : instrument_view.capo
        # set the fret's data: pitch_class dependent on string tuning + capo + fret
        pitch_class = open_pitch.pitch.pitch_class.offset(fret + capo)

        # whether the fret is included in the scale or whatever needs to be highlighted
        fret_included = instrument_view.pitch_ids.include? pitch_class.id

        # html class for the fret visual element
        fret_class = fret_included ? " fret--included" : ""
        if fret_included
            # if a progression_chord is provided to the instrument view, the view is meant to highlight that chord within the context of a song's progression
            if instrument_view.progression_chord
                # the degree is assess from this fret's pitch class, compared against the chord's root note given the instrument view's specified key and scale
                fret_class << " fret--degree-#{instrument_view.progression_chord.chord.assess_pitch_degree(pitch_class.position, instrument_view.progression_chord.root_note_by_keyscale(instrument_view.key, instrument_view.scale).position).to_s}"
            # otherwise, the instrument view is meant to highlight the specified pitches, provided in order of their ascending corresponding degrees
            else
                # set a degree-specific class, +1 because .index is 0-indexed
                fret_class << " fret--degree-#{instrument_view.pitch_ids.index(pitch_class.id) + 1}"
            end
        end

        # 0th fret (open string) gets a special class
        fret_class << (fret == 0 ? " fret--outside" : "")

        # print the fret
        return tag.div class: "fret" + fret_class, "data-pitch-class" => pitch_class, "data-pitch" => Pitch.find_by_id(open_pitch.pitch_id + fret).id do
            pitch_class.letter
        end
    end

    # for filling in the fretboard where there aren't any actual frets (think 5-string banjo, for the 1st string)
    def invisible_fret
        tag.div class: "fret fret--invisible"
    end
end
