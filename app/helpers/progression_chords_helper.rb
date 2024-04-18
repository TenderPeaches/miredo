module ProgressionChordsHelper
    def degree_picker(form)
        degree_select(form)
    end

    def degree_select(form)
        scale = form.object.progression_template&.active_scale || Scale.default
        key = form.object.progression_template&.active_key || Key.default
        degree_chords = scale.get_degree_chords key

        form.collection_select :degree,
            degree_chords,
            ->(chord) {chord[:pitch_class_id]},
            ->(chord) {"#{chord[:degree]} - #{chord[:print]}"},
            {selected: degree_chords.first[:pitch_class_id]}
    end
end
