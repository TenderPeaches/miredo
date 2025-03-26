module SortHelper

    def rotate_sort_order(descending_first = false, previous_order = :none)
        case previous_order
        when :none
            descending_first ? :desc : :asc
        when :asc
            descending_first ? :none : :desc
        when :desc
            descending_first ? :asc : :none
        end
    end

    def sort_button(label, link, id, current_sort = :none, inverted_sort: false)
        sort_order = rotate_sort_order(inverted_sort, current_sort)
        turbo_link_to "#{label}#{sort_order_label(current_sort)}", "#{link}#{sort_order.to_s}&format=turbo_stream", id: id
    end
end
