class Chord < ApplicationRecord
    has_many :chord_components
    has_many :intervals, through: :chord_components
    has_many :interval_qualities, through: :chord_components

    def self.for_select
        Chord.all
    end

    def for_select
        "#{name} (#{notation})"
    end

    def self.regex_selector
        selector = ""

        # notation descending because we want to test for longer (more specific) notations first. For instance, 7sus2 must be checked before 7, otherwise only the 7 would be matched
        Chord.order(notation: :desc).each do |chord|
            unless chord.notation.empty?
                unless selector.empty?
                    selector << "|"
                end
                  selector << chord.notation.gsub("/", "\/").gsub("+", "\+").gsub("*", "\*")
            end
        end

        selector
    end

    # gets an array of all the pitch classes that comprise this chord for a given tonic
    # @tonic => PitchClass
    def notes(tonic)
        notes = []

        self.chord_components.each do |factor|
            notes << tonic.offset(factor.semitones)
        end

        notes
    end
end
