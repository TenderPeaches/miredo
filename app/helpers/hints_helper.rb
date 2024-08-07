module HintsHelper
    def help_section(title, content = [])
        tag.section class: "help" do
            safe_join [
                tag.h2(title.to_s),
                content.collect { |bit| tag.p bit }
            ]
        end
    end

    def hint_label(locale_label)
        tag.p t("hints.#{locale_label}"), class: "hint"
    end
end
