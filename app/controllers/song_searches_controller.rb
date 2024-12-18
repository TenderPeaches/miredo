# search for a song through the catalog
class SongSearchesController < ApplicationController
    def create
        @query = params[:search]

        # queries that are empty or too short should be disregarded, user feedback to be implemented later as it's a fringe case
        if @query.blank? || @query.size < 2
            redirect_to songs_path
        else
            @results = Songs::Searcher.new(current_user).search @query
        end
    end
end
