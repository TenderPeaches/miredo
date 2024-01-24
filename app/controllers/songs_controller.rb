class SongsController < ApplicationController
    before_action :set_song, only: %i[ show play define_progressions define_song_progressions ]
    # GET /
    def index
        @songs = Song.includes(:artists) 

        if (params[:sort] == 'capo')
            @songs = @songs.order('capo')
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
        @song.save

        if (params[:from] == 'home')
            redirect_to "/"
        else
            redirect_to "/" << params[:id] << "/"
        end
    end

    # GET /song/[id]/define_progressions
    def define_progressions
        @progressions = Progression.find_by_sql('SELECT pc.chord_id, pc.degree, pc.modifier, p.id, p.tag, p.reps FROM progressions AS p INNER JOIN progression_chords AS pc ON pc.progression_id = p.id INNER JOIN song_progressions AS sp ON sp.progression_id = p.id AND sp.song_id = ? GROUP BY p.id', [ @song.id ])
    end

    def define_song_progressions
    end

    # GET /edit/[id]
    def edit
        @song = Song.find(params[:id])
        @progressions = Progression.all.sort { |a, b| a.sortable <=> b.sortable }
    end

    private
    def set_song 
        @song = Song.find(params[:id])
    end 

    def song_params
        params.require(:song).permit(:name, :number, :duration, :capo, :bpm, :key_id, :scale_id, :new_album_name, :new_artist_name, :album_id, song_contributions_attributes: [:id, :artist_id ])
    end
end
