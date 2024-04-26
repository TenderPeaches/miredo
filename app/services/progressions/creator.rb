module Progressions
    ##
    # handles creation of progressions
    class Creator
        def initialize(song, user)
            @song = song
            @submitter = user
        end

        ##
        # build a progression with id=nil,
        def build(progression_template = nil)

            # @song might be a new record
            if @song
                progression = @song.progressions.build
            else
                progression = Progression.new
            end

            progression.progression_template = progression_template

            Result.new(progression)
        end

        ##
        # instanciate a progression in the DB
        def create(progression_params)
            progression = Progression.create(progression_params)

            # assign a sequence number to the progression, depending on the existing progressions' sequence numbers and on a sequence number that may have explicitly been set by the user for this progression
            sequencer = Progressions::Sequencer.new(@song)
            sequence_result = sequencer.set(progression)

            Result.new(progression)
        end

        class Result
            attr_reader :progression
            def initialize(progression)
                @progression = progression
            end

            def valid?
                @progression.errors.empty?
            end
        end
    end
end
