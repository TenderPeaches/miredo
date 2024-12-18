class SetlistSequenceAdjustmentsController < ApplicationController

    def new
        set_setlist
        set_song

        # ensure the setlist is being modified by the user who owns it
        if @setlist.user == current_user
            @shift_result = Setlists::Sequencer.new(@setlist).shift(@song, params[:direction].to_sym, { all: params[:all]&.to_sym == :true })
        end
    end

    private

    def set_setlist
        @setlist = Setlist.includes(:songs).find_by_id(params[:setlist_id])
    end

    def set_song
        @song = Song.find_by_id(params[:song_id])
    end
end
