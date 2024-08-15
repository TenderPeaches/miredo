class ApplicationController < ActionController::Base

    def index
        @songs_showcase = Songs::Showcaser.new(current_user).showcase
    end

    private
    def set_current_user
        @user = current_user
    end

    def after_sign_in_path_for(user)
        root_path
    end

    def after_sign_out_path_for(user)
        root_path
    end
end
