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
        # default setting values
        def default_settings
            {
                instrument_id: 1,           # default instrument ID, assume guitar
                hot_plays_threshold: 3,      # how many times per timelapse a song needs to be played to be considered "hot"
                hot_timelapse: 7,           # over a period of how many days ago a song needs to have been played X times in order to be considered "hot"
                old_heart_threshold: 60,    # how many days ago must a song must have been played (by heart) before it's flagged as needing a practice }
            }
        end
    end
end
