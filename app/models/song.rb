class Song < ApplicationRecord
    include Filterable
    include Sortable

    belongs_to :album, optional: true
    belongs_to :key, optional: true
    belongs_to :scale, optional: true
    belongs_to :time_signature, optional: true
    belongs_to :submitter, class_name: "User", optional: true
    has_many :song_contributions, dependent: :destroy
    has_many :artists, through: :song_contributions
    has_many :progressions, dependent: :destroy
    has_many :progression_templates, dependent: :destroy
    has_many :song_plays, dependent: :destroy
    has_many :user_favorites

    validates :number, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :duration, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }, allow_nil: true
    validates :capo, comparison: { greater_than_or_equal_to: -1, less_than_or_equal_to: 11 }, numericality: { only_integer: true }, allow_nil: true
    validates :bpm, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360 }, numericality: { only_integer: true }, allow_nil: true
    validates_associated :song_contributions

    attr_accessor(:new_album_name, :new_artist_name)        # in case of new album/artist

    accepts_nested_attributes_for :artists
    accepts_nested_attributes_for :song_contributions, :allow_destroy => true
    accepts_nested_attributes_for :progressions
    accepts_nested_attributes_for :progression_templates

    before_validation :create_album_from_name, :assert_song_contributions
    after_save :set_song_contributions

    # filter by song name
    scope :filter_by_name, -> (name) { where("name LIKE ?", "%#{name}%")}

    # filter by suggested capo
    scope :filter_by_capo, -> (capo) { where(capo: capo)}

    # filter by whether the user has the song as a favorite
    scope :filter_by_favorite, -> (user_id) { joins(:user_favorites).where(user_favorites: { user_id: user_id }) }

    # filter by the song's suggested key and scale
    scope :filter_by_keyscale, -> (key_id, scale_id) { where(key_id: key_id, scale_id: scale_id) }

    # filter by artists who contributed to writing the song
    scope :filter_by_artist, -> (artist_id) { joins(:song_contributions).where(song_contributions: { artist_id: artist_id })}

    # filter by user who submitted the song to Miredo
    scope :filter_by_submitter, -> (user_id) { where(submitter_id: user_id) }

    # filter by visibility to a given user
    scope :filter_by_visibility, -> (user_id) { where(submitter_id: user_id).or(Song.where(is_public: true)) }

    # sort by most played for a given user
    scope :sort_by_most_played_by_user, -> (user_id, order = :desc) { joins(:song_plays).where(song_plays: { user_id: user_id }).group(:song_id).order("COUNT(song_plays.id) #{order.to_s.upcase}")}

    # sort by last played for a given user
    scope :sort_by_last_played, -> (user_id, order = :desc) { joins(:song_plays).select('songs.id', 'songs.name', 'songs.capo', 'MAX(song_plays.played_at) AS "last_played_date"').where(song_plays: { user_id: user_id}).group(:song_id).order(last_played_date: order) }

    # return only public songs
    scope :only_public, -> { where(is_public: true) }

    OUTPUT_LINE_TYPE__CHORDS = "chords"
    OUTPUT_LINE_TYPE__LYRICS = "lyrics"

    VALID_FILTERS = [:key, :capo, :artist, :favorite]


    def plays(user)
        if user
            song_plays.where(user: user).size
        else
            0
        end
    end

    # filters a collection of songs, against a set of params
    # @params => params of a typical song_filter form (that would be submitted to a SongFiltersControllert), see VALID_FILTERS for valid filter keys; can also contain a :user_id value for some filters that need the current_user.id
    def self.filter(params, collection = Song.none)
        VALID_FILTERS.each do |filter|
            if params[filter]
                case filter
                when :key then
                    collection = collection.filter_by_keyscale(params[:key], params[:scale])
                when :capo then
                    collection = collection.filter_by_capo(params[:capo])
                when :artist then
                    collection = collection.filter_by_artist(params[:artist])
                when :favorite then
                    # only filter for favorites, otherwise do nothing to keep including both favorites and non-favorites, rather than just non-favorites
                    if params[:favorite] == "true" && params[:user_id]
                        collection = collection.filter_by_favorite(params[:user_id])
                    end
                end
            end
        end
        collection
    end

    def last_play(user)
        song_plays.where(user: user).where.not(played_at: nil).last
    end

    def last_played(user)
        last_play(user)&.played_at
    end

    def can_edit?(user)
        if user
            self.submitter == user || user.is_admin?
        end
    end

    def has_unsequenced_progressions?
        self.progressions.where(sequence: nil).any?
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

    def next_sequence_gap
        sequences = progressions.map { |p| p.sequence }
        # find any gap in the sequence numbers
        gap = sequences.compact.inject { |a, e| e == a.next ? e : (break a.next)}

        if sequences.include? gap
            nil
        else
            gap
        end
    end

    def has_sequence_gap?
        !next_sequence_gap.nil?
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
    def artist
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

    def label_with_artist
        "#{self.name} - #{self.artist}"
    end

    # pick a song (id) at random
    def self.random_id(user_id = 0)
        # the song must be either public or submitted by the user making the request
        Song.where(is_public: true).or(Song.where(submitter_id: user_id)).order("RANDOM()").limit(1).first.id
    end

    def self.random_id_of_capo(capo)
        Song.where(capo: capo).order("RANDOM()").limit(1).first.id
    end

    def ordered_progressions
        self.progressions.order(sequence: :asc)
    end
    # List of all the distinct chords that are included in this song's progressions
    def distinct_chords

        chords = []
        #% need a list of each chord, including those that might be of progressions with a different key than the key's default song
        self.ordered_progressions.each do |progression|
            #% check all of the progression's template's chords
            progression.progression_template.ordered_chords.each do |progression_chord|
                cypher = ProgressionChords::Interpreter.new(progression.effective_key, progression.effective_scale).to_cypher(progression_chord, print_duration: false).cypher
                #% see if the chord, paired with the given key (either from progression, progression_template or song), already exists in the list
                unless chords.any? { |chord| chord[:cypher] == cypher }
                    chords << {
                        cypher: cypher,
                        notes: progression_chord.chord.notes(progression_chord.root_note_in_progression(progression))
                    }
                end
            end
        end

        chords
    end

    # if true => the song's chords structure and lyrics are obtained through Song_Progression entries
    # if false => the song's chord structure and lyrics are obtained through parsing the lib.txt file
    def upgraded?
        #! If song progressions are added, they will be assumed to be valid and the song will be considered upgraded so make sure each song's progressions are valid, if they exist, before committing them
        return progressions.any?
    end

    def progressions_attributes=(progressions_attributes)
        progressions_attributes.each do |spa|

        end
    end
end
