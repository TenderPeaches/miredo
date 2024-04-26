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
end
