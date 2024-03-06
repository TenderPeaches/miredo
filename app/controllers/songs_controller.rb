class SongsController < ApplicationController
    before_action :set_song, only: %i[ show play define_progressions define_song_progressions ]
    # GET /
    def index
        @songs = Song.includes(:artists)

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
        if @song.upgraded?
            # capo can be provided as query string argument, if absent then use the song's suggested capo
            @capo = (params.has_key? :capo) ? params[:capo].to_i : @song.capo

            # if there is a capo
            if @capo != 0 && @song.key
                # adjust the key accordingly, shifting from the song's base key
                @key = @song.key.shift(@capo * -1)
            # otherwise, no capo applied
            else
                # use the song key as is
                @key = @song.key    # user can play around with song key, set default value to song's default key
            end

            @scale = (params.has_key? :scale) ? params[:scale].to_i : @song.scale

            @tuning = Tuning.first
            @frets = 12
            @accepted_pitch_ids = []
            @accepted_pitches = @scale.chords_from_key(@key)

            @accepted_pitches.each do |pitch|
                @accepted_pitch_ids << pitch[:pitch_class_id]
            end

            render :show_new
        end
    end

    # POST /songs
    def create
        @song = Song.new(song_params)

        respond_to do |format|
            if @song.save
                # if redirect to define_progressions
                if params[:progressions]
                    format.html { redirect_to define_progressions_song_path(@song), notice: "Song was successfully created." }
                else
                    format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
                end
                format.json { render :show, status: :created, location: @song }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @song.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        set_song

        respond_to do |format|
            if @song.update(song_params)
                if @song.progressions.count > 0
                    format.html { redirect_to show_song_new_path }
                else
                    format.html { redirect_to define_progressions_song_path }
                end
            else
                flash.alert = @song.errors.full_messages
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end


    # PATCH /save/[id]
    def save
    end

    def new
        @song = Song.new
        @song.song_contributions << SongContribution.new
    end

    def scales
        render json: { body: params }
    end

    # GET /play/[id]
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

    # GET /song/[id]/define_progressions
    def define_progressions
    end

    def define_song_progressions
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
