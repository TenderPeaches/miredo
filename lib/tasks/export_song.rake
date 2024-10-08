namespace :song do
    desc "exports a song and its associated progressions"
    task :export, [:song_id] => [:environment] do |task, args|
        song_ids = [args[:song_id].to_i]

        args.extras.each do |id|
            song_ids << id.to_i
        end

        song_ids.each do |song_id|
            export_song(Song.find(song_id))
        end
    end

    task :export_all => [:environment] do |task|
        Song.order(id: :asc).each do |song|
            export_song(song)
        end
    end

    task :export_plays, [:user_id] => [:environment] do |task, args|
        File.open("db/exports/song_plays_for_user_#{args[:user_id]}.rb", "w") do |file|

            SongPlay.where(user_id: args[:user_id]).each do |song_play|
                file.puts "SongPlay.create(song_id: #{song_play.song_id}, user_id: #{args[:user_id]}, played_at: #{song_play.played_at ? "'#{song_play.played_at.strftime("%D %T %Z")}'" : 'nil'}, by_heart: #{song_play.by_heart ? 'true' : 'false'})"
            end
        end
    end

    private
    def export_song(song)

        File.open("db/exports/song_#{song.id}.rb", 'w') do |file|

            excluded_keys = ['created_at', 'updated_at', 'id', 'progression_template_id', 'nb_practices', 'last_practiced']

            file.puts "song = Song.find_by_id(#{song.id})"
            file.puts "unless song"

            song_attributes = song.serializable_hash.delete_if{|k,v| excluded_keys.include? k}

            song_params = attributes_hash_to_string(song_attributes)

            file.puts "  song = Song.create(#{song_params})"
            file.puts "end"

            progression_templates = {}

            song.progression_templates.each_with_index do |progression_template, i|

                progression_template_attributes = progression_template.serializable_hash.delete_if{|k,v|excluded_keys.include? k}
                progression_template_attributes.delete("song_id")
                progression_template_params = attributes_hash_to_string(progression_template_attributes)
                progression_template_params << "song: song"

                file.puts "progression_template_#{i+1} = ProgressionTemplate.create(#{progression_template_params})"

                progression_template.progression_chords.each do |progression_chord|
                    progression_chord_attributes = progression_chord.serializable_hash.delete_if{|k,v|excluded_keys.include? k}

                    progression_chord_params = attributes_hash_to_string(progression_chord_attributes)

                    progression_chord_params << "progression_template: progression_template_#{i+1}"

                    file.puts "ProgressionChord.create(#{progression_chord_params})"
                end

                progression_template.progressions.each do |progression|
                    progression_attributes = progression.serializable_hash.delete_if{|k,v|excluded_keys.include? k}

                    progression_params = attributes_hash_to_string(progression_attributes)

                    progression_params << "song: song, progression_template: progression_template_#{i+1}"

                    file.puts "Progression.create(#{progression_params})"
                end
            end

            file.puts "Songs::Player.new(User.first).play({played_at: \"#{song.last_practiced.to_s}\", song_id: #{song.id}}, #{song.nb_practices})"
        end


        puts "Exported song ##{song.id}: #{song.name} to db/exports/song_#{song.id}.rb"
    end

    def attributes_hash_to_string(hash)
        string = ""

        hash.each do |key, value|
            if value.nil?
                string << "#{key}: nil, "
            elsif value.is_a? String
                string << "#{key}: \"#{value.gsub("\"", "\\\"")}\","
            else
                string << "#{key}: #{value}, "
            end
        end

        string
    end
end
