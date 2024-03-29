class InstrumentChoicesController < ApplicationController

    ##
    # offer instrument choices
    def new
        Instrument.all
    end

    ##
    # register user instrument choice
    def create
        set_instrument
        set_song
        set_key

        puts @instrument.inspect
        puts Instrument.find_by_name("Piano").inspect


        @accepted_pitch_ids = []
        @accepted_pitches = @song.scale.chords_from_key(@key)

        @accepted_pitches.each do |pitch|
            @accepted_pitch_ids << pitch[:pitch_class_id]
        end

        if @instrument == Instrument.find_by_name("Piano")
            render "instrument_choices/use_piano"
        end
    end

    private
    def set_song
        @song = Song.find(params[:song_id])
    end

    def set_instrument
        @instrument = Instrument.find(params[:instrument_id])
    end

    def set_key
        @key = Key.find_by_id(params[:key_id]) || @song.key
    end
end
