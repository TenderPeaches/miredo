# when viewing a (digital representation of an) instrument
class InstrumentViewsController < ApplicationController
    def create
        @instrument = if params[:instrument] then
            Instrument.find_by_id(params[:instrument])
        elsif current_user && current_user.user_settings then
            Instrument.find_by_id(current_user.user_settings.default_instrument)
        else
            Instrument.default
        end

        capo_relative_pitches = if params[:capo_relative_pitches].nil? then
            # default to true if unspecified, because it's the beginner-friendly setting
            true
        else
            # otherwise, setting was specified by the user, so use that
            params[:capo_relative_pitches]
        end

        @capo = params[:capo].to_i

        @song = Song.find_by_id(params[:song])
        if @song
            @chords = if capo_relative_pitches && @instrument.uses_capo then
                @song.distinct_chords(@capo * -1)
            else
                @song.distinct_chords
            end
        end

        @key = Key.find_by_id(params[:key])
        @scale = Scale.find_by_id(params[:scale])

        @instrument_view = Instruments::Viewer.new(@instrument).view({
            fret_count: params[:fret_count]&.to_i || 12,
            tuning_id: @instrument.default_tuning&.id,
            capo: @capo,
            capo_relative_pitches: capo_relative_pitches,
            key: @key,
            scale: @scale,
        })
    end
end
