class User < ApplicationRecord
    has_many :submissions, class_name: "Song", inverse_of: :submitter, foreign_key: :submitter_id
    has_many :user_favorites, dependent: :destroy
    has_many :favorites, through: :user_favorites, source: :song
    has_one :user_setting
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    def admin?
        self.is_admin
    end

    # because humans typically pluralize settings
    def user_settings
        self.user_setting
    end

    def default_instrument
        if user_settings
            user_settings.default_instrument
        else
            Instrument.default
        end
    end
end
