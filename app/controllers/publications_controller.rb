#todo unused
class PublicationsController < ApplicationController

    def index
        @publication_lines = [
            PublicationLine.new("lyrics", "I use Miredo to build a local, ad-free repository of songs I enjoy playing guitar and singing to", ["lyrics"]),
            PublicationLine.new("listing", "I use Miredo to keep track of how many times I've played each song, when I've last played them and which ones I can play by heart", ["listing"]),
            PublicationLine.new("instruments", "I use Miredo to highlight which frets or keys are included within a song's key and scale", ["instruments"]),
            PublicationLine.new("keys", "I use Miredo to play songs in any given key, without having to think too hard about what each of the main chords of the scale looks like", ["scale", "capo"]),
        ]

        render layout: "publication"
    end

    private
    class PublicationLine
        attr_reader :id, :text, :images
        def initialize(id = "", text = "", images = [])
            @id = id;
            @text = text;
            @images = images;
        end
    end
end
