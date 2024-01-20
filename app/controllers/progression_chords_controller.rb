class ProgressionChordsController < ApplicationController

    def 
    
    def create
        puts params.inspect
        if progression_chord_params[:id] > 0
            update
        else
            @progression_chord = ProgressionChord.new(progression_chord_params)

            respond_to do |format|
                if @progression_chord.save 
                    format.html
                    format.json
                else            
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @progression_chord.errors, status: :unprocessable_entity }
                end
            end
        end
    end 

    def update 
        @progression_chord = ProgressionChord.find_by_id(progression_chord_params[:id])
        # through /songs/:id/define_progressions
        respond_to do |format|
            if @progression_chord.update(progression_chord_params)
                format.html { render json: { success: 'yes' }, notice: "success" }
            else 
                format.json { render json: @progression_chord.errors, status: :unprocessable_entity }
            end
        end
    end

    # minimum required parameters to print an arbitrary progression_chord
    # verify :params => ['key', 'scale', 'chord_type', 'degree', 'modifier', 'duration'], :only => :print
    def print_from_request()
        print(params[:key], params[:scale])
    end

    def print(key, scale)
        pc = ProgressionChord.new(chord: Chord.find_by_id(params[:chord]), degree: params[:degree], modifier: params[:modifier], duration: params[:duration], bass_degree: nil, bass_modifier: nil)

        render plain: pc.print(Key.find_by_id(key), Scale.find_by_id(scale))

    end

    # when using a progression_chord generator, inputs need this data to reflect the state of the progression chord
    def generator_info() 
        pc = ProgressionChord.find_by_id(params[:progression_chord_id])

        data = {
            display: render,
            plain: pc.print(Key.find_by_id(params[:key_id]), Scale.find_by_id(params[:scale_id])),
            degree: pc.degree,
            modifier: pc.modifier,
            bass_degree: pc.bass_degree,
            bass_modifier: pc.bass_modifier,
            chord: pc.chord_id
        }

        render json: data
    end

    private
    def progression_chord_params 
        params.require(:progression_chord).permit(:progression_id, :chord_id, :degree, :duration, :modifier, :bass_modifier, :bass_degree, :sequence)
    end
end
