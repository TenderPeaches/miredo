class CapoValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
=begin
        unless value.is_a?(Integer) && (value >= -1 && value <= 10)
            record.errors.add attribute, (options[:message] || " is not a valid capo position. Valid positions go from -1 to 10")
        end
=end
    end
end

class Song < ApplicationRecord
    belongs_to :album, optional: true
    belongs_to :key, optional: true
    belongs_to :scale, optional: true
    belongs_to :time_signature, optional: true
    has_many :song_contributions
    has_many :artists, through: :song_contributions
    has_many :song_progressions
    has_many :progressions, through: :song_progressions

    validates :number, comparison: { greater_than: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :duration, comparison: { greater_than: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :nb_practices, comparison: { greater_than: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :last_practiced, comparison: { less_than: DateTime.now }, allow_nil: true
    validates :capo, capo: true
    validates :bpm, comparison: { greater_than: 0, less_than_or_equal_to: 360 }, numericality: { only_integer: true }, allow_nil: true

    attr_accessor :new_album_name           # to allow create album through create song form

    before_save :create_album_from_name

    OUTPUT_LINE_TYPE__CHORDS = "chords"
    OUTPUT_LINE_TYPE__LYRICS = "lyrics"

    def create_album_from_name
        create_album(:name => new_album_name)
    end

    # default output => display chords & lyrics on separate lines
    def default_output
        # output as array of {type:...,content:...} hashes, each representing a line of output
        output = []

        # finds chords, muted strums, etc. : 1> 3x Am,  2> Bmaj7 xx .., etc.
        chords_pattern = /(([\d]+>)[ ]*(([[ABCDEFG#maj67bdi\-:\\]\.\/ ](?!>))*[ ]*?(x\d)*)*)/
        # list of chord patterns found 
        chord_patterns = []

        # splitter pattern to split "1> Am" into "1>" and "Am"
        splitter_pattern = /([\d]+)>(.*)/

        # current pattern identifier (the "1" in "1> Am")
        current_pattern_id = 0

        # find all iterations of patterns such as "1> 3x Am" in the song's chords
        chords.scan(chords_pattern) do |match|
            # extract the pattern id from "1>" => "1"
            current_pattern_id = match[1].match(splitter_pattern)[1]
            
            # chords are meant to be declared in order, so first pattern to be declared is 1>
            # thus, when 1> is first encountered, chord_patterns.size is 0; then when 2> is first encountered, chord_patterns.size is 1, etc.
            if chord_patterns.size < current_pattern_id.to_i
                # add the pattern it self, so "1> 3x Am" => "3x Am"; it can be accessed as chord_patterns[pattern_id - 1] to account for 0-indexed array
                chord_patterns << match[0].match(splitter_pattern)[2]
            end
        end

        # lyrics pattern, split between pairs of semi-colons "; (...) ;"
        lyrics_pattern = /([^;]*)[;]/

        # find all lyrics blocks in the song's lyrics
        lyrics.scan(lyrics_pattern) do |line|
            # scan rets an array of result, need a string
            line = line[0]
            # extract chord patterns, if any
            while line.match(splitter_pattern) do
                # print the chord pattern
                output << {type: OUTPUT_LINE_TYPE__CHORDS, content: chord_patterns[line.match(splitter_pattern)[1].to_i - 1]}
                # remove the pattern identifier from the lyrics' line
                line = line.match(splitter_pattern)[2]
            end

            output << {type: OUTPUT_LINE_TYPE__LYRICS, content: line}
        end
        
        return output
    end

    # get artists label (a string, not a music label), as multiple artists might contribute to one song
    def get_artists
        output = ""
        artists.each do |artist|
            # add coma if not first artist to be added to the list
            unless output == ""
                output << ", "
            end
            output << artist.name
        end
        #> [Artist 1], [Artist 2], ...
        return output
    end

    # if true => the song's chords structure and lyrics are obtained through Song_Progression entries
    # if false => the song's chord structure and lyrics are obtained through parsing the lib.txt file
    def upgraded?
        #! If song progressions are added, they will be assumed to be valid and the song will be considered upgraded so make sure each song's song_progressions are valid, if they exist, before committing them
        return song_progressions.any?
    end

    def song_progressions_attributes=(song_progressions_attributes)
        song_progressions_attributes.each do |spa| 
            
        end
    end
end
