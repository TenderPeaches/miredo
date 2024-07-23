module FiltersHelper
    # collection_options:
    # name => name of the input field
    # items => collection of items that can be filtered for
    # key => unique key used to select the item
    # label => label shown to the user
    def filter_option type, form, label = nil, id = nil, collection_options = {}
        case type
        when :keyscale then
            keyscale_filter_field form, label, id
        when :capo then
            capo_filter_field form, label, id
        when :collection then
            collection_filter_field form, label, id, collection_options
        when :boolean then
            boolean_filter_field form, label, id
        end
    end

    private
    # field that contains a toggle-able filter option
    def filter_field form, label, id, &block
        safe_join [
            tag.div(class: "filter-field", id: "#{id.kebabcase}-filter", data: { controller: "filter-toggle", "filter-toggle-target" => "filter" }) do
                if block_given?
                    safe_join [
                        filter_label(label),
                        block.call,
                        filter_hidden_input(form, id)
                    ]
                else
                    safe_join [
                        filter_label(label),
                        filter_hidden_input(form, id)
                    ]
                end
            end,
        ]
    end

    def filter_hidden_input form, id, value = false
        form.hidden_field id, value: value, id: "#{id}-filter-active", data: { "filter-toggle-target" =>  "flag" }
    end

    # filters use toggle-labels - press on the label to activate/deactivate the filter, effectively turning the label into a checkbox of sorts
    def filter_label label
        # check_box_tag
        tag.label label, class: "filter-label"
    end

    def keyscale_filter_field form, label, id
        double_collection_filter_field form, label || "Key & Scale", id || "key", { name: :key, items: Key.for_select, key: :id, label: :shorthand }, { name: :scale, items: Scale.for_select, key: :id, label: :name }
    end

    def capo_filter_field form, label, id, instrument = Instrument.default
        filter_field form, label || "Suggested Capo", id || "capo" do
            select_tag :capo, options_for_select(instrument.capo_range)
        end
    end

    def collection_filter_field form, label, id, collection_options = {}
        filter_field form, label, id do
            select_tag collection_options[:name], options_from_collection_for_select(collection_options[:items], collection_options[:key], collection_options[:label])
        end
    end

    def boolean_filter_field form, label, id
        filter_field form, label, id
    end

    # each collection options may contain:
    # name => name of the input field
    # items => collection of items that can be filtered for
    # key => unique key used to select the item
    # label => label shown to the user
    def double_collection_filter_field form, label, id, first_collection_options = {}, second_collection_options = {}
        filter_field form, label, id do
            tag.div do
                safe_join [
                    select_tag(first_collection_options[:name], options_from_collection_for_select(first_collection_options[:items], first_collection_options[:key], first_collection_options[:label])),
                    select_tag(second_collection_options[:second], options_from_collection_for_select(second_collection_options[:items], second_collection_options[:key], second_collection_options[:label]))
                ]
            end
        end
    end
end
