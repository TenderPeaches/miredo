class SetlistsController < ApplicationController
    def index
        if user_signed_in?
            # premium feature
            if current_user.is_contributor
                @setlists = Setlist.where(user: current_user)
            else
                redirect_to root_path
            end
        else
            redirect_to new_user_session_path
        end
    end

    def new
        @setlist = Setlist.new(user: current_user)
    end

    def create
        if current_user.is_contributor
            @setlist = Setlist.create(setlist_params.merge({user: current_user}))
        else
            redirect_to root_path
        end
    end

    def edit
        set_setlist

        unless @setlist.user == current_user
            redirect_to root_path
        end
    end

    def update
        set_setlist

        @setlist.update(setlist_params)
    end

    def destroy
        set_setlist
        @setlist_id = @setlist.id
        if current_user == @setlist.user
            @setlist.destroy
        end
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
