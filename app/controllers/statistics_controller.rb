class StatisticsController < ApplicationController
    def index
        if user_signed_in?
            @stats = Statistics::Compiler.new(current_user).compile
        else
            redirect_to root_path
        end
    end
end
