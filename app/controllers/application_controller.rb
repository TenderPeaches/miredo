class ApplicationController < ActionController::Base
    def index
        @songs_showcase = Songs::Showcaser.new(current_user).showcase
    end

    private
    def set_current_user
        @user = current_user
    end
end
