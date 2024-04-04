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
    belongs_to :submitter, class_name: "User", optional: true
    has_many :song_contributions, dependent: :destroy
    has_many :artists, through: :song_contributions
    has_many :song_progressions, dependent: :destroy
    has_many :progressions, dependent: :destroy
    has_many :song_plays, dependent: :destroy

    validates :number, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :duration, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :nb_practices, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }, allow_nil: true
   # validates :last_practiced, allow_nil: true
    validates :capo, capo: true
    validates :bpm, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360 }, numericality: { only_integer: true }, allow_nil: true
    validates_associated :song_contributions

    attr_accessor(:new_album_name, :new_artist_name)        # in case of new album/artist

    accepts_nested_attributes_for :artists
    accepts_nested_attributes_for :song_contributions, :allow_destroy => true
    accepts_nested_attributes_for :song_progressions
    accepts_nested_attributes_for :progressions

    before_validation :create_album_from_name, :assert_song_contributions
    after_save :set_song_contributions

    OUTPUT_LINE_TYPE__CHORDS = "chords"
    OUTPUT_LINE_TYPE__LYRICS = "lyrics"

    def plays(user)
        song_plays.where(user: user).size
    end

    def last_play(user)
        song_plays.where(user: user).where.not(played_at: nil).last
    end

    def last_played(user)
        last_play(user)&.played_at
    end

    def create_album_from_name
        # only if song is not on any album
        if album_id.nil?
            create_album(:name => new_album_name)
        end
    end

    def keyscale
        "#{key.natural_shorthand} #{scale.name}"
    end

    #! the form passes along song_contributions with artist_id == 1 when artist field is left blank (for new artists), so weed that one out before the validations are made otherwise it raises a validation error with artist_id missing
    def assert_song_contributions
        self.song_contributions = self.song_contributions.where.not(artist_id: nil)
    end

    def set_song_contributions

        # If a new artist name has been provided
        unless new_artist_name.nil? || new_artist_name.blank?
            # create the artist and a song_contribution entry that links them to this song
            # adding to the array so existing song contributions are not overwritten
            song_contributions << SongContribution.create(song_id: id, artist: Artist.create(name: new_artist_name))
            # reset new artist name to prevent this block from triggering more than once on consecutive saves
            new_artist_name = nil
        end
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

    def self.random_id
        Song.order("RANDOM()").limit(1).first.id
    end

    def self.random_id_of_capo(capo)
        Song.where(capo: capo).order("RANDOM()").limit(1).first.id
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
