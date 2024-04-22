class SongsController < ApplicationController
    before_action :set_song, only: %i[ play ]
    # GET /
    def index
        if user_signed_in?
            @songs = Song.includes(:artists).where(is_public: true).or(Song.where(submitter_id: current_user.id))
        else
            @songs = Song.includes(:artists).where(is_public: true)
        end

        # if request specified a user ID
        if params[:user_id]
            # only show songs submitted by the given user
            @songs = @songs.where(submitter_id: params[:user_id])
        end

        # sort the list
        if (params[:sort] == 'capo')
            @songs = @songs.order(capo: :asc)
        elsif params[:sort] == 'plays'
            @songs = @songs.left_joins(:song_plays).where('song_plays.user_id = ?', User.first.id).group(:song_id).order('COUNT(song_plays.id) DESC')
        elsif params[:sort] == 'last_played'
            @songs = @songs.left_joins(:song_plays).select('songs.id', 'songs.name', 'songs.capo', 'MAX(song_plays.played_at) AS "last_played_date"').where('song_plays.user_id = ?', User.first.id).group(:song_id).order(:last_played_date => :desc)
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
            # update the progression themselves because @song.update doesn't do anything about it
            song_params[:progressions_attributes].each do |i, progression|
                Progression.find(progression[:id]).update(sequence: progression[:sequence])
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
