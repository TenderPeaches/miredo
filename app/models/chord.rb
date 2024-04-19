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

        Chord.all.each do |chord|
            unless chord.notation.empty?
                unless selector.empty?
                    selector << "|"
                end
                  selector << chord.notation.gsub("/", "\/").gsub("+", "\+").gsub("*", "\*")
            end
        end

        selector
    end
end
