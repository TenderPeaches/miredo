namespace :song do
    desc "using the deprecated nb_practices attribute, creates a matching number of SongPlays"
    task :create_plays => [:environment] do |task|
        player = Songs::Player.new(User.first)
        Song.each do |song|
            create_song_plays(song, player)
        end
    end

    private
    def create_song_plays(song, player = Songs::Player.new(User.first))
        player.play({song_id: song.id}, song.nb_practices)
    end
end
