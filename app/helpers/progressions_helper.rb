module ProgressionsHelper
    def progression_lyrics_preview(progression)
        cutoff = 25
        if progression.lyrics.nil?
            ""
        elsif progression.lyrics.size <= cutoff
            progression.lyrics
        elsif progression.lyrics.size < (2 * cutoff)
            progression.lyrics[..cutoff] << "..."
        else
            progression.lyrics[..cutoff] << "..." << progression.lyrics[cutoff*-1, cutoff]
        end
    end

    def progressions_sequencer_header
        tag.div class: "progressions-sequencer-header table-header" do
            safe_join [
                tag.span(Progression.human_attribute_name(:tag)),
                tag.span(Progression.human_attribute_name(:lyrics)),
                tag.span(Progression.human_attribute_name(:template_tag)),
                tag.span(t('content.progressions.sequencing')),
            ]
        end
    end
end
