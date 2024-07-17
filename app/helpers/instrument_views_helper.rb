module InstrumentViewsHelper

    def instrument_view_tag(instrument_view, &block)
        tag.div class: "#{instrument_view.instrument.instrument_template.filename.kebabcase}-view" do
            capture(&block)
        end
    end

    ## draws a fret (for a single string, not the actual neck-width fret) for a fretted instrument, given:
    # @open_pitch => TuningPitch of the open string under the fret
    # @fret => draw the nth fret
    # @capo => assume capo at nth position
    # @accepted_pitch_ids => Pitch IDs that should be highlighted somehow
    def fretted_instrument_fret(open_pitch, fret, capo, accepted_pitch_ids)
        # set the fret's data: pitch_class dependent on string tuning + capo + fret
        pitch_class = open_pitch.pitch.pitch_class.offset(fret + capo)

        # whether the fret is included in the scale or whatever needs to be highlighted
        fret_included = accepted_pitch_ids.include? pitch_class.id

        # html class for the fret visual element
        fret_class = fret_included ? " fret--included" : ""
        if fret_included
            # set a degree-specific class, +1 because .index is 0-indexed
            fret_class << " fret--degree-#{accepted_pitch_ids.index(pitch_class.id) + 1}"
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
