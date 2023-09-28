class ScalesController < ApplicationController
    def index 
        @scales = Scale.all
        @keys = Key.all
    end

    def get
        if params[:key] && params[:scale]
            render html: Scale.find(params[:scale]).print_in_key(Key.find(params[:key]))
        else 
            render html: "<h2>nothing</h2>"
        end
    end

    def get_degree_chords(key) 
        scale = Scale.find_by_id(params[:scale])

        return scale.get_degree_chords(Key.find_by_id(params[:key]), params[:modifier].to_i)
    end

    # from_request contains the info in params[] rather than actual parameters
    def get_degree_chords_from_request()
        render json: get_degree_chords(Key.find_by_id(params[:scale]))
    end
end
