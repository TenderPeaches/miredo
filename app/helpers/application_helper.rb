module ApplicationHelper

    def app_title
        "Miredo"
    end

    def app_logo
        tag.h1 class: "app-title" do
            safe_join [
                tag.span(app_title[0..1]),
                tag.span(app_title[2..3]),
                tag.span(app_title[4..5]),
            ]
        end
    end

    def page_title
        if content_for? :page_title
            yield :page_title
        else
            app_title
        end
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

    # definition element
    def definition(defined_term, definition)
        tag.div class: "definition" do
            safe_join [
                tag.dfn(defined_term),
                tag.span(definition)
            ]
        end
    end

    # paginator
    def paginator(collection = [], page_count = 1, current_page = 1, options = {})
        if page_count > 1
            tag.nav class: "paginator#{options[:class] ? (' ' + options[:class]) : ''}", id: "#{options[:id] ? options[:id] : 'paginator'}" do
                case page_count
                # for no/1 page's worth of content
                when 0..1
                    # just display a "1", no link
                    tag.span "1"
                # for a few pages, not enough to bother with ellipses
                when 2..5
                    print_pages(page_count, current_page, songs_path)
                # for 6+ pages
                else
                    # going to depend on the currently displayed page
                    # straight up programming_horror, but it'll work for a bit until I make something less ridiculous lol
                    case current_page
                    when 1
                        safe_join [
                            tag.span("1"),
                            link_to("2", songs_path(page: 2)),
                            link_to("3", songs_path(page: 3)),
                            tag.span("..."),
                            link_to(page_count, songs_path(page: page_count)),
                        ]
                    when 2
                        safe_join [
                            link_to("1", songs_path(page: 1)),
                            tag.span("2"),
                            link_to("3", songs_path(page: 3)),
                            tag.span("..."),
                            link_to(page_count, songs_path(page: page_count)),
                        ]
                    when 3
                        safe_join [
                            link_to("1", songs_path(page: 1)),
                            link_to("2", songs_path(page: 2)),
                            tag.span("3"),
                            link_to("4", songs_path(page: 4)),
                            tag.span("..."),
                            link_to(page_count, songs_path(page: page_count))
                        ]
                    when 4
                        safe_join [
                            link_to("1", songs_path(page: 1)),
                            tag.span("..."),
                            link_to("3", songs_path(page: 3)),
                            tag.span("4"),
                            link_to("5", songs_path(page: 5)),
                            raw("#{page_count > 6 ? tag.span('...') : ''}"),
                            link_to(page_count, songs_path(page: page_count))
                        ]
                    when 5
                        safe_join [
                            link_to("1", songs_path(page: 1)),
                            tag.span("..."),
                            link_to("4", songs_path(page: 4)),
                            tag.span("5"),
                            raw("#{if page_count >= 7 then link_to("6", songs_path(page: 6)) end}"),
                            raw("#{if page_count > 7 then tag.span("...") end}"),
                            link_to(page_count, songs_path(page: page_count))
                        ]
                    else
                        safe_join [
                            link_to("1", songs_path(page: 1)),
                            tag.span("..."),
                            link_to((current_page - 1).to_s, songs_path(page: (current_page - 1))),
                            tag.span(current_page.to_s),
                            raw("#{if page_count > current_page + 1 then link_to((current_page + 1).to_s, songs_path(page: current_page + 1)) end}"),
                            raw("#{if page_count - current_page > 2 then tag.span('...') end}"),
                            raw("#{if page_count > current_page then link_to(page_count, songs_path(page: page_count)) end}"),
                        ]
                    end
                end
            end
        end
    end

    private
    def print_pages(page_count, current_page, path)
        html_output = []
        page_count.times do |p|
            # 1-indexed page
            the_page = p + 1
            # current page gets a non-link
            html_output << if the_page == current_page
                tag.span the_page.to_s
            else
                # every other page gets a link
                #(!) need to account for cases where path might already have QSA, maybe regex it
                #(!) this won't apply the filters
                turbo_link_to the_page.to_s, "#{path}?page=#{the_page}"
            end
        end
        safe_join(html_output)
    end
end
