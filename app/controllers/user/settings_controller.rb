# Each user may set their own settings
class User::SettingsController < ApplicationController
    # when user requests a list of settings that they can see/change
    def index
        if user_signed_in?
            # need to display instrument choices as setting
            @instruments = Instrument.all

            # assume current user wishes to change own settings
            @user = current_user
            # include failsafe for if user has no user_setting entry for some reason, then one will be created here
            @user_settings = @user.user_settings || UserSettings::Setter.new(@user).set_default
            render "user/settings/index"
        else
            redirect_to new_user_session_path
        end
    end

    # update user settings; create not necessary because settings are created alongside the user and should never be deleted, only updated
    def update
        unless params[:cancel] || current_user.nil?
            UserSettings::Setter.new(current_user).set(user_setting_params)

            flash.now.notice = t('content.settings.update_notice')
        end
    end

    private
    def user_setting_params
        params.require(:user_setting).permit(:instrument_id, :hot_plays_threshold, :hot_timelapse, :old_heart_threshold)
    end
end
