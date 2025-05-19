module InstrumentViewsHelper

    def instrument_view_tag(instrument_view, &block)

        tag.div class: "#{instrument_view.instrument.instrument_template.filename.kebabcase}-view#{instrument_view.instrument.instrument_template.has_fretboard? ? " fretted-instrument" : ""}" do
            capture(&block)
        end
    end

    ## draws a fret (for a single string, not the actual neck-width fret) for a fretted instrument, given:
    # @open_pitch => TuningPitch of the open string on which the fret is calculated
    # @fret => Integer indicating the position of the fret from the neck (or capo)
	# @instrument_view => InstrumentView of the intstrument for which the fret is rendered
    def fretted_instrument_fret(open_pitch, fret, instrument_view)
		# The capo is only set to the InstrumentView's capo value if the pitches need to be displayed as absolute pitches, rather than relative to capo, in which case they are displayed as if the Capo was the neck of the fretted instrument.
        capo = instrument_view.capo_relative_pitches ? 0 : instrument_view.capo

		# The fret's pitch class is obtained from adding the fret and the capo's position to the open string's pitch.
        pitch_class = open_pitch.pitch.pitch_class.offset(fret + capo)

        # Whether the fret needs to be highlighted, depending on the InstrumentView's paramters
        fret_included = instrument_view.pitch_ids.include? pitch_class.id

        # Highlighted frets get an extra HTML class
        fret_class = fret_included ? " fret--included" : ""

		# Highlight fret, if necessary
        if fret_included

            # If a progression_chord is provided to the instrument view, that view is meant to highlight that chord within the context of a song (or a specific progression)
            if instrument_view.progression_chord
				# Assess the degree of the fret's note, using its pitch and the root note of the chord, given the InstrumentView's key and scale
                fret_class << " fret--degree-#{instrument_view.progression_chord.chord.assess_pitch_degree(pitch_class.position, instrument_view.progression_chord.root_note_by_keyscale(instrument_view.key.shift(instrument_view.capo_relative_pitches ? instrument_view.capo * -1 : 0), instrument_view.scale).position).to_s}"
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
