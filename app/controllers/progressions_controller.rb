class ProgressionsController < ApplicationController
    before_action :set_or_new_progression, only: %i[ add_chord ]
    before_action :set_progression, only: %i[ update ]
    
    def index
        # doesn't apply
    end

    def show
    end

    def new
        @progression = Progression.new 

        respond_to do |format|
            format.turbo_stream { render "songs/define_progressions/add_progression" }
        end
    end

    def create
    end 

    def update 
        puts @progression.inspect
        # through /songs/:id/define_progressions
        respond_to do |format|
            if @progression.update(progression_params)
                format.html { render json: { success: 'yes' }, notice: "success" }
                format.turbo_stream
            else 
                format.json { render json: @progression.errors, status: :unprocessable_entity }
                format.turbo_stream { render 'progressions/update', status: :unprocessable_entity }
            end
        end
    end

    def destroy 
    end

    def add_chord
        @progression_chord = @progression.progression_chords.build

        respond_to do |format|
            format.turbo_stream { render "progressions/add_chord" }
        end
    end

    private
    def set_progression
        @progression = Progression.find_by_id(params[:id])
    end

    def set_or_new_progression
        unless set_progression
            @progression = Progression.new
        end
    end

    def progression_params 
        params.require(:progression).permit(:tag, :scale, :key, :reps, :id, progression_chords_attributes: [:id, :degree, :modifier, :bass_modifier, :bass_degree, :chord_id, :duration, :staccato, :muted, :_destroy] )
    end
end
