class UserSongsController < ApplicationController
    def index
        @songs = Song.where(submitter_id: @user.id)
    end

    private
    def set_user
        @user = Song.find(params[:user])
    end
end
