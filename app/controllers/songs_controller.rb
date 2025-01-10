# songs model controller
class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /songs => Any list of songs, params might include filter/sort/search options
    def index
        setup_session_list_options

        song_list_result = Songs::Lister.new(current_user, session[:list_options]["songs"], expected_page: [params[:page].to_i, 1].max).list({ filter_options: params[:filter_options], sort_options: params[:sort_options] })

        @songs = song_list_result.songs
        @sort_control_id = song_list_result.sort_control_id
        @sort_control_order = song_list_result.sort_control_order
        @page_count = song_list_result.page_count
        @expected_page = song_list_result.expected_page
        session[:list_options]["songs"] = song_list_result.new_options
    end

    # GET /[id]/
    def show
        set_song

        if @song.nil?
            redirect_to songs_path
        elsif @song.public? || current_user == @song.submitter
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
        params.require(:sort_options).permit(:capo, "last_played(#{current_user&.id})", "most_played_by_user(#{current_user&.id})", :created_at)
    end

    def filter_params
        params.require(:filter_options)
    end

    # ensure the session is properly setup to store the list options
    def setup_session_list_options
        # initialize the session's [:list_options][:songs] structure
        unless session[:list_options]
            session[:list_options] = { "songs" => {
                "filter_options" => {},
                "song_options" => {},
            }}
        end

        unless session[:list_options]["songs"]
            session[:list_options]["songs"] = {}
        end
    end
end
