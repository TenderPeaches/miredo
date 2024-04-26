class ProgressionSequenceAdjustmentsController < ApplicationController
    def new
        set_progression

        shift_result = Progressions::Sequencer.new(@progression.song).shift(@progression, params[:direction].to_sym, { all: params[:all]&.to_sym == :true })

        render "songs/show_sequencer"
    end

    private
    def set_progression
        @progression = Progression.find(params[:progression_id])
    end
end
