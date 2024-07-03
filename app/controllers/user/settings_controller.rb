# Each user may set their own settings
class User::SettingsController < ApplicationController
    # when user requests a list of settings that they can see/change
    def index
        # need to display instrument choices as setting
        @instruments = Instrument.all

        # assume current user wishes to change own settings
        @user = current_user
        @user_settings = @user.user_settings
        render "user/settings/index"
    end

    # update user settings; create not necessary because settings are created alongside the user and should never be deleted, only updated
    def update
        unless params[:cancel] || current_user.nil?
            UserSettings::Setter.new(current_user).set(user_setting_params)
        end
    end

    private
    def user_setting_params
        params.require(:user_setting).permit(:instrument_id)
    end
end
