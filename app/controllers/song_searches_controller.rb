# search for a song through the catalog
class SongSearchesController < ApplicationController
    def create
        @query = params[:search]
        @results = Songs::Searcher.new(current_user).search @query
    end
end
