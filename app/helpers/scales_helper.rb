module ScalesHelper
    def degree_class(degree)
        "degree-#{degree}"
    end

    def scales_table_header
        tag.div class: "table-header" do
            safe_join [
                tag.span(Scale.model_name.human),
                tag.span("#{Interval.model_name.human.pluralize} (#{t('music_theory.semitones_from_root')})")
            ]
        end
    end
end
