module Users
    class Creator
        def create(user_params)
            @user = User.create(user_params)
            # assign default user settings
            @user.user_settings = UserSettings::Setter.new.set_default
        end
    end
end
