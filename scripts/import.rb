# imports old format, shouldn't be ever needed again but in case - escape all double-quotes in lyrics: " => \" & create files song_seeds.rb and artist_seeds.rb

# open library
lib = File.open("lib.txt")

# list of songs in the library
songs = []    

current_song = {}

def read_lib_line(line) 
    begin
        # eg "#name:Hysteria"
        match = line.match(/#([\w]+):(.*)/)
        # eg "name"
        label = match[1]
        # eg "Hysteria"
        value = match[2]

        return { 'label' => label, 'value' => value } 
    rescue => exception
        p 'Following line throws ArgumentError: ' << line << "\n" << exception

        return nil
    end
end

# line-by-line
lib.each do |line|
    begin
        # if line matches the entity separation character string
        if line.match(/###/)
            # this line finishes the input for the current song's data block, so push the song's data onto the compiled list
            songs << current_song
            # reset the current song
            current_song = {}
        # otherwise, this is part of a song's data block
        else
            # read the data
            data_line = read_lib_line(line)

            # store the data in the current_song hash
            current_song[data_line["label"]] = data_line["value"]
        end
    rescue => exception
        print line
    else
        
    end
end

seeds_file = File.open('song_seeds.rb', 'w')

def seed_artists(artists, songs)

    seeds_file = File.open('artist_seeds.rb', 'w')

    seeds_file.puts "# artists\n"
    artists.each do |artist|
        artist_seed = 'Artist.create_or_find_by(name: "%{artist}")' % {artist: artist}
        seeds_file.puts artist_seed << "\n"
    end

    seeds_file.puts "\n# song contributions" 
    songs.each do |song|
        song_contribution_seed = 'SongContribution.create_or_find_by(song: Song.find_by(name: "%{song}"), artist: Artist.find_by(name: "%{artist}"))' % {song: song['song'], artist: song['artist']}
        seeds_file.puts song_contribution_seed << "\n"
    end
end

def songs_hash_to_seeds(songs, seeds_file)
    artists = []        # reference to artists
    albums = []         # reference to albums
    songs.each do |song_hash|

        # add song artist to list of artists if not already there
        song_artist = song_hash["artist"]
        unless artists.include?(song_artist)
            artists << song_artist
        end

        # same for album
        song_album = song_hash["album"]
        unless albums.include?(song_album)
            albums << song_album
        end

        # sanitize lyrics input for double quotes
        song_lyrics = song_hash['lyrics']
        song_lyrics.gsub(/"/, '\"')    

        song_seed = 'Song.create_or_find_by(name: "%{name}", album: Album.find_or_create_by(name: "%{album}"), number: "%{number}", duration: "%{duration}", nb_practices: "%{nb_practices}", last_practiced: "%{last_practice}", capo: "%{capo}", chords: "%{chords}", lyrics: "%{lyrics}")' % {name: song_hash['song'], album: song_hash['album'], number: song_hash['songnumber'], duration: song_hash['duration'], nb_practices: song_hash['nbpractice'], last_practice: song_hash['lastpractice'], capo: song_hash['capo'], chords: song_hash['chords'], lyrics: song_lyrics}
        seeds_file.puts song_seed << "\n"  # disable when done so as to not overwrite
    end

    seed_artists(artists, songs)
end

songs_hash_to_seeds(songs, seeds_file) 
