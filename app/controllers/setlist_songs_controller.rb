class SetlistSongsController < ApplicationController
    def new
        @query = params[:search]
        @results = Songs::Searcher.new(current_user).search @query
        @setlist_id = params[:setlist_id]
    end

    def create
        setlist_id = params[:setlist_id]
        song_id = params[:song_id]
        if setlist_id && song_id
            SetlistSong.create(song_id:, setlist_id:)
        end
    end
end
