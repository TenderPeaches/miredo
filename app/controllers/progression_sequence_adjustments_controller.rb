# actions to adjust the sequence of a progression in a song
class ProgressionSequenceAdjustmentsController < ApplicationController
    def new
        set_progression

        if @progression.song.can_edit? current_user

            @shift_result = Progressions::Sequencer.new(@progression.song).shift(@progression, params[:direction].to_sym, { all: params[:all]&.to_sym == :true })

            render "songs/show_sequencer"
        end
    end

    private
    def set_progression
        @progression = Progression.includes(:song).find(params[:progression_id])
    end
end
