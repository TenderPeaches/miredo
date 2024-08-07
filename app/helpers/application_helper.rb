module ApplicationHelper

    def app_title
        "Miredo"
    end

    def turbo_link_button(text, target, options = {})
        link_to text, target, class: "button" + (options[:class] ? " #{options[:class]}" : ""), data: { turbo_stream: true, turbo_method: options[:method] || :get }, id: options[:id], title: options[:title]
    end

    def turbo_link_to(text, target, options = {})
        link_to text, target, class: options[:class], data: { turbo_stream: true, turbo_method: options[:method] || :get}, id: options[:id], title: options[:title]
    end

    def link_button_to(text, target, options = {})
        link_to text, target, class: "button" + (options[:class] ? " #{options[:class]}" : ""), method: options[:method] || :get, id: options[:id], title: options[:title]
    end

    def cta_with_description(text, target, description)
        tag.div class: "cta" do
            safe_join [
                link_to(text, target),
                tag.span(description, class: "description"),
            ]
        end
    end

    def login_cta
        tag.div class: "cta" do
            safe_join [
                tag.span(t('hints.log_in')),
                tag.span(" — "),
                link_to(t('cta.log_in'), new_user_session_path)
            ]
        end
    end

    # string added to a sort_option label to visually indicate the sorting order that will be applied
    def sort_order_label(sort_order)
        if sort_order.downcase.to_sym == :asc
            " ▲"
        elsif sort_order.downcase.to_sym == :desc
            " ▼"
        else
            ""
        end
    end
end
