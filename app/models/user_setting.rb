## set of user settings
class UserSetting < ApplicationRecord
    belongs_to :user
    belongs_to :instrument

    def default_instrument
        self.instrument
    end

    # default setting values
    class Default
        # default plays in a given timelapse for a song to be considered "hot"
        HOT_PLAYS = 3
        # default timelapse in days during which song plays are accrued towards the "hot" counter
        HOT_DAYS = 7

        # number of days for which a song last played by heart needs to not have been played in order to be considered an "old heart"
        OLD_HEART_DAYS = 60
    end
end
