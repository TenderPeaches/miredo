module ProgressionTemplatesHelper
    def progression_templates_form_id(progression_template)
        "#{dom_id(progression_template)}__form"
    end
end
