## set of user settings
class UserSetting < ApplicationRecord
    belongs_to :user
    belongs_to :instrument

    def default_instrument
        self.instrument
    end
end
