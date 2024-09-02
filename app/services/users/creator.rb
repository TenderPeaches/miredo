module Users
    class Creator
        def create(user_params)
            @user = User.create(user_params)
            # assign default user settings
            UserSettings::Setter.new(@user).set_default
        end
    end
end
