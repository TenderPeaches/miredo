class HeaderLinksController < ApplicationController
    def index
        # whether the links should appear or be withdrawn from the screen
        @show = params[:show] == "true"

        # update the user's session with the setting, so that it carries over from one page to the next; use true/nil dichotomy to minimize storage use and to prevent having to compare against "false" when checking the flag
        session[:show_header_links] = if @show then true else nil end
    end
end
