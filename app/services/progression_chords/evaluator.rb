module ProgressionChords
    ##
    # As progression chords are always defined relative to their progression, there must be a process that can translate a set of pitch classes into a ProgressionChord given a certain key and scale
    class Evaluator
        attr_accessor :key, :scale
        def initialize(key, scale)
            @key = key
            @scale = scale
        end

        ##
        # evaluate one or multiple pitch classes that are part of a single progression chord
        def evaluate(pitch_classes)
            # singluar pitch class
            if pitch_classes.is_a? PitchClass
                result = Result.new(evaluate_single_pitch pitch_classes)
            # multiple pitch classes
            elsif pitch_classes.is_a?(Array)
                result = Result.new
            elsif pitch_classes.is_a?(ActiveRecord::Relation)
                result = Result.new
            end

            # if there's a single match, use that one - simple enough
            if result.single_match?
                result
            # if there's more than two matches, need to make an educated guess as to which one is more appropriate...
            else
                # for now rather than try to algorithmize more abstract concepts of musical theory, just use an arbitrary one
                result.degree_candidates.first
            end
        end

        private
        class Result
            attr_reader :degree_candidates
            def initialize(degree_candidates = [])
                # allow passing a single degree candidate object directly
                if degree_candidates.is_a? ProgressionChords::Evaluator::DegreeCandidate
                    @degree_candidates = [degree_candidates]
                else
                    @degree_candidates = degree_candidates
                end
            end

            def match?
                @degree_candidates.any?
            end

            def single_match?
                @degree_candidates.size == 1
            end

            def match
                if self.single_match?
                    @degree_candidates.first
                end
            end

            def degree
                self.match&.degree
            end

            def modifier
                self.match&.modifier
            end
        end

        class DegreeCandidate
            attr_reader :degree, :modifier
            def initialize(degree, modifier, pitch_class)
                @degree = degree
                @modifier = modifier
                @pitch_class = pitch_class
            end
        end

        def evaluate_single_pitch(pitch_class)
            # association between each degree of the scale and its interval with pitch_class
            intervals = {}

            # go through each degree and assess the interval between the pitch class and the degree's natural pitch class
            @scale.get_degree_chords(@key).each do |degree|
                intervals[degree[:degree_int]] = pitch_class.id - degree[:pitch_class_id]
            end

            # in case there is no exact match, keep track of the closest matches - pitch classes within a 1 or 2 semitones interval
            close_matches = { 1 => [], 2 => [] }

            # go through each degree's interval
            intervals.each do |degree, interval|
                # if the interval is 0, pitch_class matches the degree exactly
                if interval == 0
                    # return immediately, no need to evaluate anything else
                    return DegreeCandidate.new(degree, interval, pitch_class)
                # otherwise if within a 2 semitones spread, keep tabs on
                elsif interval.abs <= 2
                    close_matches[interval.abs] << DegreeCandidate.new(degree, interval, pitch_class)
                end
            end

            # if at this point, no degree matches the pitch class exactly because of the explicit return used above
            # if there are degrees within a 1-semitone spread, return those as candidates
            if close_matches[1].any?
                close_matches[1]
            # otherwise use degrees 2 semitones away, if any
            elsif close_matches[2].any?
                close_matches[2]
            # if no degree within 2 semitones, return nil
            else
                nil
            end
        end
    end
end
