module Songs
    class Lister
        # @user is the user to whom this list applies, presumably the user currently logged in
        # @current_options is a hash containing the current "sort_options" and "filter_options"
        # @songs is the list of songs from which this list is compiled, presumably all the songs stored on the website
        def initialize(user = nil, current_options = {}, songs: Song.includes(:song_plays, :song_contributions, :artists), page_size: Song.page_size, expected_page: 1)
            @user = user
            @songs = songs
            @page_size = page_size
            @expected_page = expected_page
            @current_options = current_options

            initialize_current_options

            # 0-indexed because the 1st page (@expected_page == 1) is offset by 0 entries, 2nd page offset by @page_size * 1 entries, etc.
            @offset = (@expected_page.to_i - 1) * @page_size
        end

        def list(options = {})
            new_options = assign_list_options(options[:filter_options], options[:sort_options], options[:reset_list])

            filter_options = new_options["filter_options"]
            # tailor the list to a specific user
            if @user
                # enforce a filter that only selects songs visibile to the user, either by virtue of being public or having been submitted by said user
                @songs = Song.filter(filter_options.merge({ visibility: @user.id }), @songs)
            # assume the list is being made for a user that isn't logged in
            else
                # only select from the list of public songs
                @songs = Song.filter(filter_options, @songs.only_public)
            end

            # page count is collection count / how many items per page, rounded up
            page_count = (@songs.size.to_f / @page_size.to_f).ceil

            sort_options = new_options["sort_options"]

            # use a particular sort if specified, unless the sort is "none"
            # assume only a single sort column, hence why it's ok to use .first here instead of some iterative structure
            if sort_options.present? && sort_options.values.first.to_sym != :none
                @songs = Song.sort(sort_options, @songs)

                if sort_options.any?
                    # keep track of the sort being applied, as the turbo response will modify the corresponding controls (to swap the :ascending/:descending order or reset the sort)
                    #! only the first sort option is applied, everything else is ignored, as sorts are applied by the click of a button. Complex sorts are TBI.
                    # convert to kebabcase because the sort controls should have an ID that matches their corresponding sort_option, prefixed with "sort-by-"
                    sort_control_id = "sort-by-#{sort_options.keys.first.match(/([\w_]+)(\(([^)]+)\))?/)[1].kebabcase}"
                    sort_control_order = sort_options[sort_options.keys.first].to_sym
                end
            # otherwise, if no sort options have been provided
            else
                # apply the default sort
                @songs = @songs.order(Song.default_sort)
            end

            # slice the songs list according to the songs/page settings, offset according to the requested page
            @songs = @songs.limit(@page_size).offset(@offset)

            Result.new(@songs, sort_control_id, sort_control_order, new_options, page_count, @expected_page)
        end

        private

        class Result
            attr_reader :songs, :sort_control_id, :sort_control_order, :new_options, :page_count, :expected_page
            def initialize(songs, sort_control_id, sort_control_order, new_options, page_count, expected_page)
                @songs = songs
                @sort_control_id = sort_control_id
                @sort_control_order = sort_control_order
                @new_options = new_options
                @page_count = page_count
                @expected_page = expected_page
            end
        end

        # ensure the current options are initialized to an acceptable state
        def initialize_current_options
            unless @current_options.has_key? "filter_options"
                @current_options["filter_options"] = {}
            end

            unless @current_options.has_key? "sort_options"
                @current_options["sort_options"] = {}
            end
        end

        # when displaying a list, it's customary to let users manipulate the lists through two options in particular:
        #   filter => to display a subset of the data, according to certain filters
        #   sort => to change the order in which the data appears
        def assign_list_options(filter_options, sort_options, reset_list = false)

            # if the request specifies that sort/filter options should be cleared
            if filter_options&.to_s&.to_sym == :clear && sort_options&.to_sym == :clear
                # reset the list options
                return {
                    "filter_options" => {},
                    "sort_options" => {},
                }
            end

            new_filter_options = if filter_options.present? then filter_options else {} end
            new_sort_options = if sort_options.present? then sort_options else {} end

            # if the request has a flag to reset the list options, overwrite whatever options are already there
            if reset_list
                return {
                    "filter_options" => new_filter_options || {},
                    "sort_options" => new_sort_options || {},
                }
            end

            # otherwise, any list options featured in the request are meant to be added to the current list options

            # merge the current filter options with the new filter options: only the options that match (like say the sort by name is set from :asc to :desc)
            new_filter_options = @current_options["filter_options"].merge new_filter_options.as_json

            # only single-column sorts are supported for now, so overwrite whatever previous sort options were present with the new sort options, unless there are no new sort options, in which case the current sort options are unchanged
            new_sort_options = if new_sort_options.present? then new_sort_options.as_json else @current_options["sort_options"] end

            return {
                "filter_options" => new_filter_options,
                "sort_options" => new_sort_options,
            }
        end
    end
end
