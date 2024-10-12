class ApplicationController < ActionController::Base
    # to allow custom parameters for registration/auth
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
        @songs_showcase = Songs::Showcaser.new(current_user).showcase
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
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
