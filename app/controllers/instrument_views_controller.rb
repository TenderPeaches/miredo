class InstrumentViewsController < ApplicationController
    def create
        @instrument_view = Instruments::Viewer.new(Instrument.find_by_id(params[:instrument]))
    end
end
