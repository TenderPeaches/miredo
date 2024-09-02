namespace :song do
    desc "using the deprecated nb_practices attribute, creates a matching number of SongPlays"
    task :create_plays => [:environment] do |task|
        player = Songs::Player.new(User.first)
        Song.all.each do |song|
            create_song_plays(song, player)
        end
    end

    private
    def create_song_plays(song, player = Songs::Player.new(User.first))
        player.play({song_id: song.id}, song.nb_practices)
        # reset the playtime to null for all songs except the last
        SongPlay.where(song: song).each do |song_play|
            # unless the song_play is the last for this given song
            unless song_play.id == SongPlay.where(song: song).last.id
                song_play.update(played_at: nil)
            end
        end
    end
end
