class ApplicationController < ActionController::Base
    private
    def set_current_user
        @user = current_user
    end
end
