module UserSettings
    ## user settings are unique to each user, so it doesn't matter whether they are created or updated - what matters is that when the user saves their settings, the changes are saved properly
    class Setter
        def initialize(user)
            @user = user
        end

        # set user settings
        def set(user_setting_params = {})
            # if user already has settings assigned to it
            if (user_setting = UserSetting.where(user: @user)).any?
                # update those settings
                user_setting.update(user_setting_params)
                # user_setting.update(default_settings.attributes.select{ |key, _| model.class.attribute_names.include?(key) && !["created_at", "id"].include?(key) })
            else
                user_setting = UserSetting.create({ user: @user }.merge(user_setting_params))
            end

            user_setting
        end

        # set/reset user settings to the default values
        def set_default
            set(default_settings)
        end

        private
        def default_settings
            { instrument_id: 1 }
        end
    end
end
