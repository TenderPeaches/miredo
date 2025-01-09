module Users
    class Creator
        def create(user_params)
            @user = User.create(user_params)

            # if creation was successful
            if @user.valid?
                # assign default user settings
                UserSettings::Setter.new(@user).set_default
            end

            @user
        end
    end
end
