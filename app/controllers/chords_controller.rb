# chord types
class ChordsController < ApplicationController
    def index
        @chords = Chord.includes(:intervals).all
    end
end
