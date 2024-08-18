class ProgressionTemplate < ApplicationRecord
    has_many :progressions
    has_many :progression_chords, dependent: :destroy
    has_many :chords, through: :progression_chords
    belongs_to :song
    belongs_to :key, optional: true
    belongs_to :scale, optional: true

    accepts_nested_attributes_for :progression_chords, allow_destroy: true

    validates :tag, length: { in: 1..32 }

    attr_accessor :uid, :cypher

    public
    # need to sort progression_templates in order to show user a list to select from somehow
    # sort by each chord that makes up the progression_template
    def sortable
        sortable_string = ""
        ordered_chords.each do |pc|
            sortable_string << pc.degree.to_s << "(" << pc.duration.to_s << ")"
        end
        return sortable_string
    end

    def ordered_chords
        progression_chords.order(:sequence)
    end

    def active_key
        if key
            key
        elsif song.key
            song.key
        else
            Key.first
        end
    end

    def active_scale
        if scale
            scale
        elsif song.scale
            song.scale
        else
            Scale.second
        end
    end

    # print the cypher
    def print_cypher(key = active_key, scale = active_scale)
        ProgressionTemplates::Interpreter.new(key,scale).to_cypher(self.progression_chords).cypher
    end

    def print(key = active_key, scale = active_scale)
        "#{print_cypher(active_key, active_scale)} x#{reps.to_s}"
    end

    # print for use in select inputs, which need to be width-controlled
    def print_for_select
        "#{tag}: #{self.print}".truncate_with_ellipsis
    end

    def print_bars(key, scale)
        printed = ""
        ordered_chords.each do |pc|

        end
    end
end
