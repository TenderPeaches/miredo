class ScalesController < ApplicationController
    def index 
        @scales = Scale.all
        @keys = Key.all
    end

    def get
        puts (params[:key] || 'nil') << ' ' << (params[:scale] || 'nil')
        if params[:key] && params[:scale]
            render html: Scale.find(params[:scale]).print_in_key(Key.find(params[:key]))
        else 
            render html: "<h2>nothing</h2>"
        end
    end
end
