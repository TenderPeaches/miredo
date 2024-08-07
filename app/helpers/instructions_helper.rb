module InstructionsHelper
    # creates an instruction label
    # @local_label => must match one of the keys under the `instructions` node in the locale file
    def instruction_label(locale_label)
        tag.p t('instructions.' + locale_label.to_s), class: "instruction"
    end
end
