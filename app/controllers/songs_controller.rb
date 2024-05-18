class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /songs => Any list of songs, params might include filter/sort/search options
    def index

        filter_options = params[:filter_options] || {}

        # if user is logged in
        if user_signed_in?
            # ensure that only songs visible to the user are shown by setting the visibility filter
            @songs = Song.filter(filter_options.merge({visibility: current_user.id}), Song.all)
        # otherwise, user is logged out
        else
            # apply filters and ensure that out of the results, only the public songs are shown
            @songs = Song.filter(filter_options).only_public
        end

        # sort the songs according to user specifications, if any
        if (params[:sort_options].present?)
            @songs = Song.sort(params[:sort_options], @songs)

            # keep track of the sort being applied, as the turbo response will modify the corresponding controls (to swap the :ascending/:descending order or reset the sort)
            #! only the first sort option is applied, everything else is ignored, as sorts are applied by the click of a button. Complex sorts are TBI.
            # convert to kebabcase because the sort controls should have an ID that matches their corresponding sort_option, prefixed with "sort-by-"
            @sort_control_id = "sort-by-#{params[:sort_options].keys.first.kebabcase}"
            @sort_control_order = params[:sort_options][params[:sort_options].keys.first].to_sym
        end
    end

    # GET /[id]/
    def show
        set_song
        if @song.upgraded?
            if @song.key.nil?
                render :edit
            else

                @key_shift = params[:key_shift]
                # capo can be provided as query string argument, if absent then use the song's suggested capo
                @capo = (params.has_key? :capo) ? params[:capo].to_i : (@song.capo || 0)
                # same for the key, either the user specifies a shift from the original key or the original is used
                @key = @key_shift ? @song.key.shift(@key_shift.to_i) : @song.key

                @scale = @song.scale

                # the key when adjusting with the capo
                @key_with_capo = @key.shift(@capo * -1)

                @tuning = Tuning.first
                @frets = 12

                @key_pitch_ids = @scale.chords_from_key(@key).map {|p| p[:pitch_class_id]}
                @capo_pitch_ids = @scale.chords_from_key(@key_with_capo).map {|p| p[:pitch_class_id]}

                render :show_new
            end
        end
    end

    # POST /songs
    def create
        @song = Song.new(song_params)

        if @song.save
            if params[:progression_templates]
                redirect_to progression_templates_path(@song), notice: "Song was successfully created."
            else
                redirect_to song_url(@song), notice: "Song was successfully created."
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        set_song
        # if updating progression order sequence
        if params[:progressions]
            sequencer = Progressions::Sequencer.new(@song)
            # just an annoying way to deal with ActionController Parameters because otherwise can't use .filter on them zzzz
            progressions = song_params[:progressions_attributes]
            progression_hashes = []
            progressions.each do |i, progression_hash|
                progression_hashes << {id: progression_hash["id"].to_i, sequence: progression_hash["sequence"].to_i}
            end

            sequencer_result = sequencer.set_all(progression_hashes)
=begin
            # update the progression themselves because @song.update doesn't do anything about it
            song_params[:progressions_attributes].each do |i, progression|
                progression = Progression.find(progression[:id])
                progression.sequence = progression[:sequence]
                sequencer.set(Progression.find(progression[:id]))
            end
=end
            if @song.has_sequence_gap? || @song.progressions.any? {|p| p.sequence.nil?}
                render :show_sequencer
            else
                # update sequencer
                render :hide_sequencer
            end
        else
            if @song.update(song_params)
                if params[:progression_templates]
                    redirect_to song_progression_templates_path @song
                else
                    redirect_to song_path @song
                end
            else
                flash.alert = @song.errors.full_messages
                render :new, status: :unprocessable_entity
            end
        end
    end

    def new
        @song = Song.new
        @song.song_contributions << SongContribution.new
    end

    # GET /edit/[id]
    def edit
        set_song
    end

    private
    def set_song
        @song = Song.find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :number, :duration, :capo, :bpm, :key_id, :scale_id, :is_public, :new_album_name, :new_artist_name, :album_id, song_contributions_attributes: [:id, :artist_id, :_destroy], progressions_attributes: [:sequence, :id])
    end
end
