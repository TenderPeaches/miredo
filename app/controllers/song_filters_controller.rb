# song filter application
class SongFiltersController < ApplicationController
    def create
        setup_session_list_options

        song_list_result = Songs::Lister.new(current_user, session[:list_options]["songs"]).list({filter_options: song_filter_params })

        @songs = song_list_result.songs
        @page_count = song_list_result.page_count
        session[:list_options]["songs"] = song_list_result.new_options
    end

    private
    def song_filter_params
        params.merge({user_id: current_user&.id })
    end

    # ensure the session is properly setup to store the list options
    #! code duplication from songs_controller
    def setup_session_list_options
        # initialize the session's [:list_options][:songs] structure
        unless session[:list_options]
            session[:list_options] = { "songs" => {
                "filter_options" => {},
                "song_options" => {},
            }}
        end

        unless session[:list_options]["songs"]
            session[:list_options]["songs"] = {
                "filter_options" => {},
                "song_options" => {},
            }
        end
    end
end
