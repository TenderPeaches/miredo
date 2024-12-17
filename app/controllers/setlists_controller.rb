class SetlistsController < ApplicationController
    def index
        if user_signed_in?
            @setlists = Setlist.where(user: current_user)
        else
            redirect_to new_user_session_path
        end
    end

    def new
        @setlist = Setlist.new(user: current_user)
    end

    def create
        @setlist = Setlist.create(setlist_params.merge({user: current_user}))
    end

    private
    def setlist_params
        params.require(:setlist).permit(:name)
    end
end
