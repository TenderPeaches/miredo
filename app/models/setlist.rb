class Setlist < ApplicationRecord
    belongs_to :user
    has_many :setlist_songs, dependent: :destroy
    has_many :songs, through: :setlist_songs

    # This setlist is the user's nth setlist, where index == n
    def index
        user.setlists.index { |setlist| setlist.id == self.id }
    end

    def label
        # if the setlist name is undefined or empty
        if self.name.blank?
            # use "Setlist #1" as a placeholder
            "#{Setlist.model_name.human} ##{self.index}"
        # otherwise use the setlist assigned name
        else
            self.name
        end
    end
end
