# chord types
class ChordsController < ApplicationController
    def index
        @chords = Chord.includes(:intervals).order(id: :asc)
    end
end
