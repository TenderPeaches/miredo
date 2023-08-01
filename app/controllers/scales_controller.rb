class ScalesController < ApplicationController
    def index 
        @scales = Scale.all
        @keys = Key.all
    end
    def show
    end
end
