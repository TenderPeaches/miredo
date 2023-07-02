class SongsController < ApplicationController
    # GET /
    def index
        @songs = Song.all

        if (params[:sort] == 'capo')
            @songs = @songs.order('capo')
        end
    end

    # GET /[id]/
    def show
        @song = Song.find(params[:id])
    end

    # GET /play/[id]
    def play
        song = Song.find(params[:id])
        if song.nb_practices.nil? 
            song.nb_practices = 1
        else
            song.nb_practices += 1
        end
        song.save

        if (params[:from] == 'home')
            redirect_to "/"
        else
            redirect_to "/" << params[:id] << "/"
        end
    end

    # GET /edit/[id]
    def edit
        @song = Song.find(params[:id])
    end

    # PATCH /save/[id]
    def save
    end
end
