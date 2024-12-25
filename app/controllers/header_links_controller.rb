class HeaderLinksController < ApplicationController
    def index
        @show = params[:show] == "true"
    end
end
