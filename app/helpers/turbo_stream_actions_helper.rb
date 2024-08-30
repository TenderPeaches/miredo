module TurboStreamActionsHelper
    def update_input(target, value)
        turbo_stream_action_tag :update_input, target: target, text: value
    end

    # show + enable
    def activate_inputs(targets)
        turbo_stream_action_tag :activate_inputs, targets: targets
    end

    # hide + disable
    def deactivate_inputs(targets)
        turbo_stream_action_tag :deactivate_inputs, targets: targets
    end

    # show
    def show(target)
        turbo_stream_action_tag :show, target: target
    end

    # hide
    def hide(target)
        turbo_stream_action_tag :hide, target: target
    end

    # add class to targets HTML class list
    def add_class(targets, value)
        turbo_stream_action_tag :add_class, targets: targets, value: value
    end

    # remove class from targets HTML class list
    def remove_class(targets, value)
        turbo_stream_action_tag :remove_class, targets: targets, value: value
    end

    # add error flags to field
    def add_field_error(target, value = "")
        turbo_stream_action_tag :add_field_error, target: target, message: value
    end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)
