module FiltersHelper
    def rotate_filter_order(descending_first = false, previous_order = :none)
        case previous_order
        when :none
            descending_first ? :desc : :asc
        when :asc
            descending_first ? :none : :desc
        when :desc
            descending_first ? :asc : :none
        end
    end
end
