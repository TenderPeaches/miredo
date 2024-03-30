class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /
    def index
        @songs = Song.includes(:artists)

        # sort the list
        if (params[:sort] == 'capo')
            @songs = @songs.order(capo: :asc)
        elsif params[:sort] == 'plays'
            @songs = @songs.order(nb_practices: :desc)
        elsif params[:sort] == 'last_played'
            @songs = @songs.order(last_practiced: :desc)
        end
    end

    # GET /[id]/
    def show
        set_song
        if @song.upgraded?

            @key_shift = params[:key_shift]
            # capo can be provided as query string argument, if absent then use the song's suggested capo
            @capo = (params.has_key? :capo) ? params[:capo].to_i : @song.capo
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

    # POST /songs
    def create
        @song = Song.new(song_params)

        if @song.save
            if params[:progressions]
                redirect_to song_progressions_path(@song), notice: "Song was successfully created."
            else
                redirect_to song_url(@song), notice: "Song was successfully created."
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        set_song

        if @song.update(song_params)
            if @song.progressions.count > 0
                redirect_to show_song_new_path
            else
                redirect_to song_progressions_path
            end
        else
            flash.alert = @song.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end


    # PATCH /save/[id]
    def save
    end

    def new
        @song = Song.new
        @song.song_contributions << SongContribution.new
    end

    # GET /play/[id]
    #! to be obsoleted by SongPlay
    def play
        if @song.nb_practices.nil?
            @song.nb_practices = 1
        else
            @song.nb_practices += 1
        end

        # last_practiced must be in the past so set a minute in the past
        @song.last_practiced = 1.hour.ago

        unless @song.save
            puts "#{@song.errors.full_messages} (#{@song.last_practiced})"
            flash.alert = @song.errors.full_messages
        end
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
        params.require(:song).permit(:name, :number, :duration, :capo, :bpm, :key_id, :scale_id, :new_album_name, :new_artist_name, :album_id, song_contributions_attributes: [:id, :artist_id, :_destroy])
    end
end
