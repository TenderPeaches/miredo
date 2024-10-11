# songs model controller
class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /songs => Any list of songs, params might include filter/sort/search options
    def index

        assign_list_options

        # use params(:page) to apply a limit(Song.page_size) to the query
        limit = Song.page_size
        # expected page, default to 1
        @expected_page = [params[:page].to_i, 1].max
        # with offset = (params(:page)-1) * Song.page_size (since offset signals the start of the batch, 1st page has a start of 0, not 20 or whatever)
        offset = (@expected_page.to_i - 1) * limit

        # if user is logged in
        if user_signed_in?
            # base the song selection off of those that are visible to the user, including their own private songs, if any, and apply to filters to that list
            @songs = Song.filter(session[:list_options]["songs"]["filter_options"].merge({visibility: current_user.id}), Song.includes(:song_plays, :song_contributions, :artists))
        # otherwise, user is logged out
        else
            # apply the filters to the public songs, which are the only ones that should be displayed to an anon user
            @songs = Song.filter(filter_options, Song.only_public.includes(:song_plays, :song_contributions, :artists))
        end

        # page count is collection count / how many items per page, rounded up
        @page_count = (@songs.size.to_f / limit.to_f).ceil

        # sort the songs according to user specifications, if any
        if session[:list_options]["songs"]["sort_options"].present?
            @songs = Song.sort(session[:list_options]["songs"]["sort_options"], @songs)

            if params[:sort_options]
                # keep track of the sort being applied, as the turbo response will modify the corresponding controls (to swap the :ascending/:descending order or reset the sort)
                #! only the first sort option is applied, everything else is ignored, as sorts are applied by the click of a button. Complex sorts are TBI.
                # convert to kebabcase because the sort controls should have an ID that matches their corresponding sort_option, prefixed with "sort-by-"
                @sort_control_id = "sort-by-#{params[:sort_options].keys.first.match(/([\w_]+)(\(([^)]+)\))?/)[1].kebabcase}"
                @sort_control_order = params[:sort_options][params[:sort_options].keys.first].to_sym
            end
        end

        # slice the songs list according to the songs/page settings, offset according to the requested page
        @songs = @songs.limit(limit).offset(offset)

    end

    # GET /[id]/
    def show
        set_song

        if @song.public? || current_user == @song.submitter
            if @song.key.nil?
                @song.update(key: Key.default)
            else
                # user might specify to shift the song to a different key
                @key_shift = params[:key_shift]
                # capo can be provided as query string argument, if absent then use the song's suggested capo
                @capo = (params.has_key? :capo) ? params[:capo].to_i : (@song.capo || 0)
                # same for the key, either the user specifies a shift from the original key or the original song key is used
                @key = @key_shift ? @song.key.shift(@key_shift.to_i) : @song.key

                # the scale should always be the song's scale
                @scale = @song.scale

                @key_with_capo = @key.shift(@capo * -1)

                # instrument to be shown as a helper
                @instrument = if current_user then current_user.default_instrument else Instrument.default end

                # instrument helper to make all the necessary data accessible to the view
                @instrument_view = Instruments::Viewer.new(@instrument).view({
                    tuning_id: @instrument.default_tuning&.id, #! could be made a user setting or be defined in the song
                    fret_count: 12, # default to 12 to see full scale
                    capo: @capo,
                    scale: @scale,
                    key: @key
                })

                @chords = @song.distinct_chords
            end
        else
            redirect_to new_user_session_path
        end
    end

    # POST /songs
    def create

        if current_user&.admin?
            @song = Songs::Creator.new(current_user&.id).create(song_params).song

            if @song.valid?
                if params[:progression_templates]
                    redirect_to progression_templates_path(@song), notice: t('')
                else
                    redirect_to song_url(@song), notice: "Song was successfully created."
                end
            else
                render :new, status: :unprocessable_entity
            end
        end
    end

    def update
        set_song

        if @song.can_edit? current_user

            Songs::Updater.new(@song).update(song_params, current_user)

            if @song.errors.any?
                flash.alert = @song.errors.full_messages
                render :edit, status: :unprocessable_entity
            else
                if params[:progression_templates]
                    redirect_to song_progression_templates_path @song
                else
                    redirect_to song_path @song
                end
            end
        end
    end

    def new
        if current_user&.admin?
            @song = Song.new
            @song.song_contributions << SongContribution.new
        else
            redirect_to new_user_session_path
        end
    end

    # GET /edit/[id]
    def edit
        set_song

        if !@song.can_edit? current_user
            redirect_to songs_path, status: :forbidden
        end
    end

    private
    def set_song
        @song = Song.includes(:song_contributions, :artists, :song_plays).find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :number, :duration, :capo, :bpm, :key_id, :scale_id, :is_public, :freeze_chords, :new_album_name, :new_artist_name, :album_id, song_contributions_attributes: [:id, :artist_id, :_destroy], progressions_attributes: [:sequence, :id])
    end

    def sort_params
        params.require(:sort_options).permit(:capo, "last_played(#{current_user&.id})", "most_played_by_user(#{current_user&.id})")
    end

    def filter_params
        params.require(:filter_options)
    end

    # when displaying a list, it's customary to let users manipulate the lists through two options in particular:
    #   filter => to display a subset of the data, according to certain filters
    #   sort => to change the order in which the data appears
    def assign_list_options
        # if the user selected new list options, they will appear in the request's parameters
        request_filter_options = if params.has_key?(:filter_options) then filter_params else {} end
        request_sort_options = if params.has_key?(:sort_options) then sort_params else {} end

        # initialize the session's [:list_options][:songs] structure
        unless session[:list_options]
            session[:list_options] = { "songs" => {}}
        end

        unless session[:list_options]["songs"]
            session[:list_options]["songs"] = {}
        end

        # if the request has a flag to reset the list options, the session's list options are not only ignored, they are to be overwritten by the request's list options which could very well be nothing
        if params[:reset_list]
            # reset the session list options
            session[:list_options]["songs"] = {
                "filter_options" => request_filter_options || {},
                "sort_options" => request_sort_options || {},
            }
        # otherwise, any list options featured in the request are meant to be added to the current list options
        else
            song_list_options = session[:list_options]["songs"]
            # session list options
            session_sort_options = song_list_options["sort_options"] || {}
            session_filter_options = song_list_options["filter_options"] || {}

            # merge the session's list options with the request's options: only the options that match (like say the sort by name is set from :asc to :desc)
            new_filter_options = session_filter_options.merge request_filter_options.as_json

            # only single-column sorts are supported for now, so overwrite whatever previous sort options were present in the session with the requests' sort options, unless there are no sort options in the request in which case the session's current sort options remain as is
            new_sort_options = if request_sort_options.present? then request_sort_options.as_json else session_sort_options end

            # store the new list options in the user's session
            session[:list_options]["songs"]["filter_options"] = new_filter_options
            session[:list_options]["songs"]["sort_options"] = new_sort_options
        end
    end
end
