class ProgressionsController < ApplicationController

    def index

    end

    def new
        if params[:progression_id]
            original = Progression.find_by_id(params[:progression_id]).dup
            @progression = original.dup
            original.progression_chords.each do |progression_chord|
                @progression.progression_chords = progression_chord.dup
            end
            @song = @progression.song
        else
            @progression = Progression.new
            @song = Song.find_by_id(params[:song_id])
            @progression.song = @song
        end
    end

    def create
        @progression = Progression.new(progression_params)
        song = Song.find_by_id(progression_params[:song_id])
        @progression_index = song.progressions.distinct.count + 1
        @progression.save
    end

    def update
        set_progression
        @progression.update(progression_params)
    end

    def destroy
        set_progression
        @progression.destroy
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
        params.require(:progression).permit(:tag, :uid, :scale, :key, :reps, :id, :song_id, progression_chords_attributes: [:id, :degree, :modifier, :bass_modifier, :bass_degree, :chord_id, :duration, :staccato, :muted, :_destroy] )
    end
end
