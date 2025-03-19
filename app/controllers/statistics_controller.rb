class StatisticsController < ApplicationController
    def index
        if user_signed_in?
            @stats = Statistics::Compiler.new(current_user).compile
            @calendar_stats = Statistics::Calendar.new(current_user).generate_stats
        else
            redirect_to root_path
        end
    end
end
