module Setlists
    #
    class Sequencer
        def initialize(setlist)
            @setlist = setlist
        end

        # sets a sequence number for a single setlist song, presumably one that was just added to the setlist
        def set(setlist_song)
            # map the setlist's song sequences
            current_sequences = @setlist.setlist_songs.map {|setlist_song| setlist_song.sequence}

            errors = []
            adjusted_setlist_songs = []

            # if the setlist song hasn't been explicitly assigned a sequence number
            if setlist_song.sequence.nil?

                # set it as highest sequence number + 1
                setlist_song.update(sequence: next_sequence)

                errors = setlist_song.errors
            # otherwise, the user attempts to explicitly set the sequence number so it is assumed to be correct
            else
                # look for conflicts
                conflict = current_sequences.include? setlist_song.sequence.to_i

                if conflict
                    # if there is a conflict, bump every sequence number by 1 if it is higher than the specificed sequence number
                    # ie if user specified sequence 3, but there already exist setlist songs with sequences [3,4,5], then bump the existing sequences to [4,5,6] and set 3 as the current setlist song's sequence
                    @setlist.setlist_songs.where(sequence: setlist_song.sequence..).each do |shifted_setlist_song|
                        # commit to an update immediately: the sequencer doesn't just assess the correct sequence number, it applies it
                        shifted_setlist_song.update(sequence: shifted_setlist_song.sequence + 1)

                        adjusted_setlist_songs << shifted_setlist_song

                        if shifted_setlist_song.errors.any?
                            errors = errors + shifted_setlist_song.errors
                        end
                    end
                end
            end

            ResultSingle.new(setlist_song, adjusted_setlist_songs, errors)
        end

        ##
        # sets sequences for an array of {id: .., sequence: ..} objects where id is a setlist_song ID; the setlist_songs are assumed to be ALL the setlist_songs in the setlist, so the sequences will be assigned accordingly
        def set_all(setlist_song_hashes)

            # as setlist_song hashes
            setlist_songs_with_conflicting_sequences = []
            setlist_songs_with_unique_sequences = []

            # setlist_songs whose sequences has been validly assigned
            sequenced = []
            # through all the hashes
            setlist_song_hashes.each do |setlist_song_hash|
                # skip if sequence has already been deemed conflicting
                unless setlist_songs_with_conflicting_sequences.any? {|conflicting_setlist_songs_set| conflicting_setlist_songs_set.first[:sequence] == setlist_song_hash[:sequence] }
                    # find those sequences for which there is more than one setlist_song assigned
                    same_sequence_setlist_songs = setlist_song_hashes.filter {|checked_hash| checked_hash[:sequence] == setlist_song_hash[:sequence]}

                    # categorize the setlist_songs depending on whether they are the only ones (or not) with a given sequence number
                    if same_sequence_setlist_songs.size > 1
                        setlist_songs_with_conflicting_sequences << same_sequence_setlist_songs
                    else
                        setlist_songs_with_unique_sequences << setlist_song_hash
                    end
                end
            end

            # if no sequence conflicts
            if setlist_songs_with_conflicting_sequences.empty?
                # update the setlist_songs one by one
                setlist_song_hashes.each do |setlist_song_hash|
                    setlist_song = SetlistSong.find(setlist_song_hash[:id])

                    # valid sequence is int >= 1
                    if setlist_song_hash[:sequence] <= 0 || !(setlist_song_hash[:sequence].is_a? Integer)
                        setlist_song.update sequence: nil
                    else
                        setlist_song.update sequence: setlist_song_hash[:sequence]
                    end
                    # keep track for feedback
                    sequenced << setlist_song
                end
            # otherwise, there are setlist songs with the same sequence numbers
            else
                # for each such set of setlist songs
                setlist_songs_with_conflicting_sequences.each do |conflicting_setlist_songs|

                    # if sequence is not 1+ integer, update setlist_song sequence to nil
                    if conflicting_setlist_songs.first[:sequence] <= 0 || !(conflicting_setlist_songs.first[:sequence].is_a? Integer)
                        conflicting_setlist_songs.each {|conflicting_setlist_song| SetlistSong.find(conflicting_setlist_song[:id]).update(sequence: nil)}
                    # sequence is valid integer
                    else
                        # resolve the sequence conflict
                        resolve_conflict(conflicting_setlist_songs, setlist_song_hashes).each do |sequenced_setlist_song|
                            sequenced << sequenced_setlist_song
                        end
                    end
                end

                # then update the setlist_songs with non-conflicting sequence numbers
                setlist_songs_with_unique_sequences.each do |setlist_song_with_unique_sequence|
                    SetlistSong.find(setlist_song_with_unique_sequence[:id]).update(sequence: setlist_song_with_unique_sequence[:sequence] >= 1 ? setlist_song_with_unique_sequence[:sequence] : nil)
                end
            end

            ResultMultiple.new(sequenced, setlist_songs_with_conflicting_sequences)
        end

        ##
        # shifts a setlist_song in a direction (:up or :down)
        # options can be :all (any value) to shift all the way to first/last position in a setlist
        # if setlist_song original sequence is nil, it will always be shifted to last position
        def shift(setlist_song, direction, options = {})
            # if a song was passed instead of a setlist_song, fetch the setlist_song matching that song
            if setlist_song.is_a? Song
                setlist_song = SetlistSong.where(setlist: @setlist, song: setlist_song).first
            end

            # bad requests could cause a song that isn't in the setlist to be shifted, exit before that can happen
            return unless setlist_song

            # before any shift is performed, check if any setlist_songs don't have a sequence assigned - resolve this first, then see if the shift is still relevant (it might not, if say none of the setlist_songs had a sequence)
            if @setlist.setlist_songs.where(sequence: nil).any?
                @setlist.setlist_songs.where(sequence: nil).each do |unsequenced_setlist_song|
                    set(unsequenced_setlist_song)
                end
            end

            # downshift -> higher sequence or sequence is originally nil
            if direction == :down || setlist_song.sequence.nil?
                # shift all the way or sequence is originally nil
                if options[:all] || setlist_song.sequence.nil?
                    shift_to_last(setlist_song)
                else
                    shift_flat(setlist_song, 1)
                end
            # upshift -> lower sequence
            else
                if options[:all]
                    shift_to_first(setlist_song)
                else
                    shift_flat(setlist_song, -1)
                end
            end
        end

        private

        ##
        # get the next sequence number
        def next_sequence
            (@setlist.setlist_songs.maximum(:sequence) || 0) + 1
        end

        ##
        # shift a setlist_song a flat number of times
        def shift_flat(setlist_song, shift_size = 1)

            return false if shift_size == 0

            shifted_setlist_songs = SetlistSong.where(setlist: @setlist, sequence: shift_size.positive? ? setlist_song.sequence.. : ..setlist_song.sequence).where.not(id: setlist_song.id).order(sequence: shift_size.positive? ? :asc : :desc).first(shift_size.abs)

            # cannot shift by more positions than there are setlist_songs
            possible_shift_size = shifted_setlist_songs.size

            # for each setlist_song that the shifted setlist_song passes through
            shifted_setlist_songs.each do |shifted_setlist_song|
                # shift them by adjusting their sequence number by the opposite polarity of the original shift: if setlist_song_1 needs to move from sequence 1 to 2 (a shift of +1), then setlist_song_2 with sequence 2 needs to be moved to sequence 1 (a shift of -1); hence multiplying shift_size / |shift_size| by -1
                shifted_setlist_song.update(sequence: shifted_setlist_song.sequence + (shift_size / shift_size.abs * -1))
            end

            # update the shifted setlist_song's sequence number by however many setlist_songs were shifted or shift_size, whichever is relevant
            setlist_song.update(sequence: setlist_song.sequence + (possible_shift_size * (shift_size / shift_size.abs)))
        end

        ##
        # shift the setlist_song to the first sequence of the setlist
        def shift_to_first(setlist_song)
            # shift setlist_song up by however many numbers is between it and 1
            shift_flat(setlist_song, 1 - setlist_song.sequence)
        end

        ##
        # shift the setlist_song to the last sequence of the setlist
        def shift_to_last(setlist_song)
            if setlist_song.sequence.nil?
                set(setlist_song)
            else
                # shift setlist_song down by however many numbers are between it and the last one
                shift_flat(setlist_song, @setlist.setlist_songs.order(:sequence).last.sequence - setlist_song.sequence)
            end
        end

        ##
        # resolve a conflict between setlist_songs that have been assigned the same sequence number
        def resolve_conflict(conflicting_setlist_songs, setlist_song_hashes)
            sequenced = []
            conflicting_setlist_songs.each_with_index do |conflicting_setlist_song, i|
                setlist_song = SetlistSong.find(conflicting_setlist_song[:id])
                # set sequence to nil for any subsequent setlist_song with that sequence number
                if i > 0
                    conflicting_setlist_song[:sequence] = nil
                end

                setlist_song.update(sequence: conflicting_setlist_song[:sequence])

                if conflicting_setlist_song[:sequence]
                    sequenced << setlist_song
                end
            end

            sequenced
        end

        class ResultSingle
            attr_reader :setlist_song
            def initialize(setlist_song, adjusted_setlist_songs, errors)
                @setlist_song = setlist_song
                @adjusted_setlist_songs = adjusted_setlist_songs
                @errors = errors
            end

            def valid?
                @errors.empty?
            end

            def adjusted_any?
                @adjusted_setlist_songs.any?
            end
        end

        class ResultMultiple
            def initialize(sequenced, conflict_sequences = [])
                @sequenced = sequenced
                @conflict_sequences = conflict_sequences
            end

            def conflict?
                @conflict_sequences.any?
            end
        end
    end
end
