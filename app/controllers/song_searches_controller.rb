# search for a song through the catalog
class SongSearchesController < ApplicationController
    def create
        @search = params[:search]
        @results = Somgs::Searcher.search @search
    end
end
