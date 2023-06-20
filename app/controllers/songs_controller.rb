class SongsController < ApplicationController
    # GET /
    def index
        @songs = Song.all
    end

    # GET /[id]/
    def show
        @song = Song.find(params[:id])
    end
end
