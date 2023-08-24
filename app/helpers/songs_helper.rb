module SongsHelper
    def setup_song(song)
        # if no song_contributions assigned to this song 
        unless song.song_contributions.any?
            # generate a single one
            song.song_contributions ||= SongContribution.new
            # use a new artist, to be overwritten if the user picks an existing artist 
            song.song_contributions.first.artist ||= Artist.new
        end

        song
    end
end
