class ProgressionSequenceAdjustmentsController < ApplicationController
    def new
        set_progression

        shift_result = Progressions::Sequencer.new(@progression.song).shift(@progression, params[:direction], { all: params[:all] == "true" })
    end

    private
    def set_progression
        @progression = Progression.find(params[:progression_id])
    end
end
