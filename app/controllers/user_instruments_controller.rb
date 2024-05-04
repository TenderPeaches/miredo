class UserInstrumentsController < ApplicationController
    def index
        set_user
        @current_instruments = UserInstrument.where(user: @user)
    end

    private
    def set_user
        if params[:user_id]
            @user = User.find(params[:user_id])
        else
            @user = current_user
        end
    end
end
