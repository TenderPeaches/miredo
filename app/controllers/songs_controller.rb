class SongsController < ApplicationController
    # GET /
    def index
        @songs = Song.includes(:artists) 

        if (params[:sort] == 'capo')
            @songs = @songs.order('capo')
        end
    end

    # GET /[id]/
    def show
        @song = Song.find(params[:id])
    end

    def create 
        @song = Song.new(song_params)

        respond_to do |format|
            
        if @song.save
            format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
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

    #todo when all songs are upgraded, rename to show
    def show_new
        @song = Song.find(params[:id])
        # capo can be provided as query string argument, if absent then use the song's suggested capo
        @capo = params.has_key? :capo ? params[:capo].to_i : @song.capo
        @key = @song.key        # user can play around with song key, set default value to song's default key
    end

    # GET /play/[id]
    def play
        song = Song.find(params[:id])
        if song.nb_practices.nil? 
            song.nb_practices = 1
        else
            song.nb_practices += 1
        end
        song.save

        if (params[:from] == 'home')
            redirect_to "/"
        else
            redirect_to "/" << params[:id] << "/"
        end
    end

    # GET /edit/[id]
    def edit
        @song = Song.find(params[:id])
        @progressions = Progression.all.sort { |a, b| a.sortable <=> b.sortable }
    end

    private
    def song_params
        params.require(:song).permit(:name, :number, :duration, :capo, :bpm, :key, :scale, song_contributions_attributes: [:id, :artist_id])
    end
end
