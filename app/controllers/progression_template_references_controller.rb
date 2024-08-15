# help page on building progression templates
class ProgressionTemplateReferencesController < ApplicationController
    def index
        # see the locale file for all the song structure definitions, whichever entries are listed here will be displayed in the reference page
        @song_structure_parts = [ "intro", "verse", "pre_chorus", "chorus", "bridge", "solo", "break", "ending", "outro", "finale" ]
    end
end
