class ProgressionsController < ApplicationController
    def index
        # doesn't apply
    end

    def show
    end

    def new
        @progression = Progression.new 

        respond_to do |format|
            format.turbo_stream { render "songs/add_progression" }
        end
    end

    def create
    end 

    def update 
        @progression = Progression.find_by_id(progression_params[:id])
        # through /songs/:id/define_progressions
        respond_to do |format|
            if @progression.update(progression_params)
                format.html { render json: { success: 'yes' }, notice: "success" }
            else 
                format.json { render json: @progression.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy 
    end

    def add_chord
        @progression_chord = ProgressionChord.new

        respond_to do |format|
            format.turbo_stream { render "progressions/add_chord" }
        end
    end

    private
    def progression_params 
        params.require(:progression).permit(:tag, :scale, :key, :id, :degree, :modifier, :bass_modifier, :bass_degree, progression_chord_attributes: [:id, :chord_id, :duration] )
    end
end
