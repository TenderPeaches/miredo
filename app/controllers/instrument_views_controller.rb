# when viewing a (digital representation of an) instrument
class InstrumentViewsController < ApplicationController
    def create
        @instrument = if current_user then Instrument.find_by_id(current_user.user_settings.default_instrument) else Instrument.default end

        @instrument_view = Instruments::Viewer.new(Instrument.find_by_id(params[:instrument])).view({
            fret_count: params[:fret_count].to_i,
            tuning_id: @instrument.default_tuning.id,
            capo: params[:capo].to_i,
            pitch_ids: JSON.parse(params[:pitch_ids])
        })
    end
end
