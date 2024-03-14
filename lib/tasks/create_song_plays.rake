namespace :song do
    desc "using the deprecated nb_practices attribute, creates a matching number of SongPlays"
    task :create_plays, [:song_id] => [:environment] do |task, args|
        create_song_plays(Song.find(args[:song_id]))
    end

    private
    def create_song_plays(song)
        Songs::Player.new(User.first)
    end
end
