# songs model controller
class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /songs => Any list of songs, params might include filter/sort/search options
    def index

        filter_options = params[:filter_options] || {}

        # use params(:page) to apply a limit(Song.page_size) to the query
        limit = Song.page_size
        # expected page, default to 1
        @expected_page = [params[:page].to_i, 1].max
        # with offset = (params(:page)-1) * Song.page_size (since offset signals the start of the batch, 1st page has a start of 0, not 20 or whatever)
        offset = (@expected_page.to_i - 1) * limit

        # if user is logged in
        if user_signed_in?
            # ensure that only songs visible to the user are shown by setting the visibility filter
            @songs = Song.filter(filter_options.merge({visibility: current_user.id}), Song.includes(:song_plays, :song_contributions, :artists)).order(Song.default_sort)
        # otherwise, user is logged out
        else
            # apply filters and ensure that out of the results, only the public songs are shown
            @songs = Song.filter(filter_options, Song.only_public.includes(:song_plays, :song_contributions, :artists)).order(Song.default_sort)
        end

        # page count is collection count / how many items per page, rounded up
        @page_count = (@songs.size.to_f / limit.to_f).ceil

        @songs = @songs.limit(limit).offset(offset)

        # sort the songs according to user specifications, if any
        if (params[:sort_options].present?)
            @songs = Song.sort(params[:sort_options], @songs)

            # keep track of the sort being applied, as the turbo response will modify the corresponding controls (to swap the :ascending/:descending order or reset the sort)
            #! only the first sort option is applied, everything else is ignored, as sorts are applied by the click of a button. Complex sorts are TBI.
            # convert to kebabcase because the sort controls should have an ID that matches their corresponding sort_option, prefixed with "sort-by-"
            @sort_control_id = "sort-by-#{params[:sort_options].keys.first.match(/([\w_]+)(\(([^)]+)\))?/)[1].kebabcase}"
            @sort_control_order = params[:sort_options][params[:sort_options].keys.first].to_sym
        end
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
end
