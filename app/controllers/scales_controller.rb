#todo unused I think
class ScalesController < ApplicationController
    def index
        @scales = Scale.all
        @keys = Key.all
    end
end
