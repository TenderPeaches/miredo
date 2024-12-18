module SetlistsHelper
    def setlist_sequencer_header
        tag.div class: "sequencer-header setlists-sequencer-header table-header" do
            safe_join [
                tag.span(Song.human_attribute_name(:name)),
                tag.span(Song.human_attribute_name(:artist)),
                tag.span(t('content.setlists.sequencing')),
            ]
        end

    end
end
