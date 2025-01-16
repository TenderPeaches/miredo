module ArtistsHelper
	def artist_links(artist)

		links = []

		artist.artist_links.each_with_index do |link, i|
			if i > 0
				links << tag.span("|")
			end
			links << link_to(link.song_link_type.label, link.url)
		end

		tag.div class: "artist-links" do
			safe_join links
		end
	end
end
