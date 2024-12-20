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

    def edit
        set_setlist
    end

    def update
        set_setlist

        @setlist.update(setlist_params)
    end

    def destroy
        set_setlist
        @setlist_id = @setlist.id
        @setlist.destroy
    end

    def show
        set_setlist
    end

    private
    def set_setlist
        @setlist = Setlist.find_by_id(params[:id])
    end

    def setlist_params
        params.require(:setlist).permit(:name)
    end
end
