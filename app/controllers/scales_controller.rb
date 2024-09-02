#todo unused I think
class ScalesController < ApplicationController
    def index
        @scales = Scale.order(id: :asc)
        @keys = Key.order(id: :asc)
    end
end
