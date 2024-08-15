# key reference page
class KeyReferencesController < ApplicationController
    def index
        @scales = Scale.for_references
    end

    def show
        @scales = Scale.for_references
        @root = Pitch.find(params[:pitch_id])
    end
end
