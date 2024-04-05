module SpecTestHelper

    # utility auth functions
    # https://github.com/heartcombo/devise/wiki/How-To:-Test-with-Capybara
    def login(user = create(:user))
        login_as(user, scope: :user)
        user
    end

    def logout
        # use Warden logout helper
        logout(:user)
    end
end
