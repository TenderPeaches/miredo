namespace :song do
    desc "exports a song and its associated progressions"
    task :export, [:song_id] => [:environment] do |task, args|
        song_ids = [args[:song_id].to_i]

        args.extras.each do |id|
            song_ids << id.to_i
        end

        song_ids.each do |song_id|
            song = Song.find(song_id)

            File.open("db/exports/song_#{song_id}.rb", 'w') do |file|

                excluded_keys = ['created_at', 'updated_at', 'id', 'progression_id']

                file.puts "song = Song.find_by_id(#{song.id})"
                file.puts "unless song"

                song_attributes = song.serializable_hash.delete_if{|k,v| excluded_keys.include? k}

                song_params = attributes_hash_to_string(song_attributes)

                #song_attributes["last_practiced"] = "'#{song_attributes["last_practiced"]}'"
                file.puts "  song = Song.create(#{song_params})"
                file.puts "end"

                progressions = {}

                song.progressions.each_with_index do |progression, i|

                    progression_attributes = progression.serializable_hash.delete_if{|k,v|excluded_keys.include? k}
                    progression_attributes.delete("song_id")
                    progression_params = attributes_hash_to_string(progression_attributes)
                    progression_params << "song: song"

                    file.puts "progression_#{i+1} = Progression.create(#{progression_params})"

                    progression.progression_chords.each do |progression_chord|
                        progression_chord_attributes = progression_chord.serializable_hash.delete_if{|k,v|excluded_keys.include? k}

                        progression_chord_params = attributes_hash_to_string(progression_chord_attributes)

                        progression_chord_params << "progression: progression_#{i+1}"

                        file.puts "ProgressionChord.create(#{progression_chord_params})"
                    end

                    progression.song_progressions.each do |song_progression|
                        song_progression_attributes = song_progression.serializable_hash.delete_if{|k,v|excluded_keys.include? k}

                        song_progression_params = attributes_hash_to_string(song_progression_attributes)

                        song_progression_params << "song: song, progression: progression_#{i+1}"

                        file.puts "SongProgression.create(#{song_progression_params})"
                    end
                end
            end

            puts "Exported song ##{song.id}: #{song.name} to db/exports/song_#{song.id}.rb"
        end
    end

    private
    def attributes_hash_to_string(hash)
        string = ""

        hash.each do |key, value|
            if value.nil?
                string << "#{key}: nil, "
            elsif value.is_a? Integer
                string << "#{key}: #{value}, "
            else
                string << "#{key}: \"#{value}\" ,"
            end
        end

        string
    end
end
