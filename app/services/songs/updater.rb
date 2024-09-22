module Songs
    class Updater
        def initialize(song)
            @song = song
        end

        def update(song_params, modifying_user = @song.submitter)
            # only perform the update if they are submitted by the user responsible for the tablature
            if modifying_user == @song.submitter
                # intercept updates to the song's key, if the "freeze chords" option was activated
                cyphers = if song_params[:key_id].to_i != @song.key_id && song_params[:freeze_chords] == "1"
                    get_cyphers
                else
                    nil
                end

                # perform the update
                @song.update(song_params)

                # if changes were made to the song's key/scale, cyphers will have been extracted
                if cyphers
                    # reapply them so the modifications don't outright change how the song is played
                    apply_cyphers cyphers
                end
            end
        end

        private
        def get_template_interpreter
            # setup an interpreter with the song's current key and scale
            ProgressionTemplates::Interpreter.new(@song.key, @song.scale)
        end

        def get_cyphers
            interpreter = get_template_interpreter
            # make a list of each template's cyphers
            @song.progression_templates.map do |progression_template|
                interpreter.to_cypher(progression_template.progression_chords).cypher
            end
        end

        # accepts lists of cyphers as returned by get_cyphers
        #! this method must be used in conjunction with get_cyphers, it needs to be applied immediately to ensure there are no disrepencies between progression templates and their chords, etc. Always generate the cyphers right before using this!
        def apply_cyphers(cyphers)
            # while the instruction remains the same as in get_cyphers, the song's key will presumably have been updated in between function calls, so this interpreter is meant to be using the song's new key (and scale)
            interpreter = get_template_interpreter

            # go through each of the song's templates
            @song.progression_templates.each_with_index do |progression_template, i|
                # using the cyphers that were made before the key change, extract the progression chords' given the new key
                new_chords = interpreter.from_cypher(cyphers[i]).progression_chords

                # overwrite the existing progression_chords
                #? worth updating over delete/insert? it seems absurd to recreate dozens of items on a single drop-down menu change
                new_chords.each_with_index do |chord, j|
                    #(!) a big test would be if progression chords are somehow out of order (like their IDs don't follow the same order as their Sequence numbers), but for now it should be OK
                    progression_template.progression_chords[j].update(chord.attributes.except("created_at", "updated_at", "id").merge("progression_template_id" => progression_template.id))
                end
            end
        end

        class Result
            attr_reader :song, :success
            def initialize(song, success = true)
                @song = song
                @succcess = success
            end
        end
    end
end
