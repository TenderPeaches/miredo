module Progressions
    #
    class Sequencer
        def initialize(song)
            @song = song
            @next = @song.progressions.maximum(:sequence) || 1
        end
        # sets a sequence number for a single progression
        def set(progression)
            # map the song's progressions' sequences
            current_sequences = progression.song.progressions.map {|song_progression| song_progression.sequence}

            errors = []
            adjusted_progressions = []

            puts "Sequencer output: current_sequences => #{current_sequences}, progression.sequence => #{progression.sequence} "

            # if progression hasn't been explicitly assigned a sequence number
            if progression.sequence.nil?

                # set it as highest sequence number + 1
                progression.update(sequence: next_sequence)

                errors = progression.errors
            # otherwise, the user attempts to explicitly set the sequence number so it is assumed to be correct
            else
                # look for conflicts
                conflict = current_sequences.include? progression.sequence.to_i

                if conflict
                    # if there is a conflict, bump every sequence number by 1 if it is higher than the specificed sequence number
                    # ie if user specified sequence 3, but there already exist progressions with sequences [3,4,5], then bump the existing sequences to [4,5,6] and set 3 as the current progression's sequence
                    @song.progressions.where(sequence: progression.sequence..).each do |song_progression|
                        # commit to an update immediately: the sequencer doesn't just assess the correct sequence number, it applies it
                        song_progression.update(sequence: song_progression.sequence + 1)

                        adjusted_progressions << song_progression

                        if song_progression.errors.any?
                            errors = errors + song_progression.errors
                        end
                    end
                end
            end

            ResultSingle.new(progression, adjusted_progressions, errors)
        end

        ##
        # sets sequences for an array of {id: .., sequence: ..} objects where id is a progression ID; the progressions are assumed to be ALL the progressions in the song, so the sequences will be assigned accordingly
        def set_all(progression_hashes)

            # as progression hashes
            progressions_with_conflicting_sequences = []
            progressions_with_unique_sequences = []

            # progressions whose sequences has been validly assigned
            sequenced = []
            # through all the hashes
            progression_hashes.each do |progression_hash|
                # skip if sequence has already been deemed conflicting
                #todo could be optimized by weeding them out as they are found
                unless progressions_with_conflicting_sequences.any? {|conflicting_progressions_set| conflicting_progressions_set.first[:sequence] == progression_hash[:sequence] }
                    # find those sequences for which there is more than one progression assigned
                    same_sequence_progressions = progression_hashes.filter {|checked_hash| checked_hash[:sequence] == progression_hash[:sequence]}

                    # categorize the progressions depending on whether they are the only ones (or not) with a given sequence number
                    if same_sequence_progressions.size > 1
                        progressions_with_conflicting_sequences << same_sequence_progressions
                    else
                        progressions_with_unique_sequences << progression_hash
                    end
                end
            end

            # if no sequence conflicts
            if progressions_with_conflicting_sequences.empty?
                # update the progressions one by one
                progression_hashes.each do |progression_hash|
                    progression = Progression.find(progression_hash[:id])

                    # valid sequence is 1+ int
                    if progression_hash[:sequence] <= 0 || !(progression_hash[:sequence].is_a? Integer)
                        progression.update sequence: nil
                    else
                        progression.update sequence: progression_hash[:sequence]
                    end
                    # keep track for feedback
                    sequenced << progression
                end
            # otherwise, there are progressions with the same sequence numbers
            else
                # for each such set of progressions
                progressions_with_conflicting_sequences.each do |conflicting_progressions|

                    # if sequence is not 1+ integer, update progression sequence to nil
                    if conflicting_progressions.first[:sequence] <= 0 || !(conflicting_progressions.first[:sequence].is_a? Integer)
                        conflicting_progressions.each {|cp| Progression.find(cp[:id]).update(sequence: nil)}
                    # sequence is valid integer
                    else
                        # resolve the sequence conflict
                        resolve_conflict(conflicting_progressions, progression_hashes).each do |sequenced_progression|
                            sequenced << sequenced_progression
                        end
                    end
                end

                # then update the progressions with non-conflicting sequence numbers
                progressions_with_unique_sequences.each do |pwus|
                    Progression.find(pwus[:id]).update(sequence: pwus[:sequence] >= 1 ? pwus[:sequence] : nil)
                end
            end

            ResultMultiple.new(sequenced, progressions_with_conflicting_sequences)
        end

        ##
        # shifts a progression in a direction (:up or :down)
        # options can be :all (any value) to shift all the way to first/last position in a song
        # if progression original sequence is nil, it will always be shifted to last position
        def shift(progression, direction, options = {})

            # before any shift is performed, check if any progressions don't have a sequence assigned - resolve this first, then see if the shift is still relevant (it might not, if say none of the progressions had a sequence)
            if progression.song.has_unsequenced_progressions?
                progression.song.progressions.where(sequence: nil).each do |unsequenced_progression|
                    set(unsequenced_progression)
                end
            end

            # downshift -> higher sequence or sequence is originally nil
            if direction == :down || progression.sequence.nil?
                # shift all the way or sequence is originally nil
                if options[:all] || progression.sequence.nil?
                    shift_to_last(progression)
                else
                    shift_flat(progression, 1)
                end
            # upshift -> lower sequence
            else
                if options[:all]
                    shift_to_first(progression)
                else
                    shift_flat(progression, -1)
                end
            end
        end

        private

        ##
        # get the next sequence number
        def next_sequence
            (@song.progressions.maximum(:sequence) || 0) + 1
        end

        ##
        # shift a progression a flat number of times
        def shift_flat(progression, shift_size = 1)

            #shifted_sequence_range = direction == :down ? (progression.sequence + 1).. : ..(progression.sequence - 1)
            return false if shift_size == 0

            # if shifting progression 1, 2, 3 positions down (higher sequence, so positive shift)
            if shift_size.positive?
                # we will pick {shift_size} progressions that follow the shifted progression in order of sequence;
                # say progressions with sequences [1,2,3,4,5] and we want to shift progression with sequence 1 to the end, shifted_sequence_range must equal 2..5 => the sequence numbers of all the progressions that must be shifted back to accomodate the shift forward of the first progression
                shifted_sequence_range = (progression.sequence + 1)..(progression.sequence + shift_size)
            # opposite for negative shifts
            else
                # shift_size is negative!
                shifted_sequence_range = (progression.sequence + shift_size)..(progression.sequence - 1)
            end
            shifted_progressions = Progression.where(song: @song, sequence: shifted_sequence_range)

            # cannot shift by more positions than there are progressions
            possible_shift_size = shifted_progressions.size

            # for each progression that the shifted progression passes through
            shifted_progressions.each do |shifted_progression|
                # shift them by adjusting their sequence number by the opposite polarity of the original shift: if progression_1 needs to move from sequence 1 to 2 (a shift of +1), then progression_2 with sequence 2 needs to be moved to sequence 1 (a shift of -1); hence multiplying shift_size / |shift_size| by -1
                shifted_progression.update(sequence: shifted_progression.sequence + (shift_size / shift_size.abs * -1))
            end

            # update the shifted progression's sequence number by however many progressions were shifted or shift_size, whichever is relevant
            progression.update(sequence: progression.sequence + (possible_shift_size * (shift_size / shift_size.abs)))
        end

        ##
        # shift the progression to the first sequence of the song
        def shift_to_first(progression)
            # shift progression up by however many numbers is between it and 1
            shift_flat(progression, 1 - progression.sequence)
        end

        ##
        # shift the progression to the last sequence of the song
        def shift_to_last(progression)
            if progression.sequence.nil?
                set(progression)
            else
                # shift progression down by however many numbers are between it and the last one
                shift_flat(progression, @song.progressions.order(:sequence).last.sequence - progression.sequence)
            end
        end

        ##
        # resolve a conflict between progressions that have been assigned the same sequence number
        def resolve_conflict(conflicting_progressions, progression_hashes)
            sequenced = []
            conflicting_progressions.each_with_index do |conflicted_progression, i|
                progression = Progression.find(conflicted_progression[:id])
                # set sequence to nil for any subsequent progression with that sequence number
                if i > 0
                    conflicted_progression[:sequence] = nil
                end

                progression.update(sequence: conflicted_progression[:sequence])

                if conflicted_progression[:sequence]
                    sequenced << progression
                end
            end

            sequenced
        end

        class ResultSingle
            attr_reader :progression
            def initialize(progression, adjusted_progressions, errors)
                @progression = progression
                @adjusted_progressions = adjusted_progressions
                @errors = errors
            end

            def valid?
                @errors.empty?
            end

            def adjusted_any?
                @adjusted_progressions.any?
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
