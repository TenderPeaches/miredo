class ArtistsController < ApplicationController
	# artists links
	before_action :can_access

	def index
		@artists = Artist.order(name: :asc)
	end

	def edit
		set_artist
		@link_types = SongLinkType.all
	end

	def update
		set_artist

		@artist.update(name: artist_params[:name])

		update_links
	end

	private
	def set_artist
		@artist = Artist.find(params[:id])
	end

	def artist_params
		# links are passed as a set of "#{SongLinkType.id}" => "[url]" values
		permitted_link_ids = SongLinkType.all.map { |type| type.id.to_s }
		params.require(:artist).permit(:name, artist_links: [permitted_link_ids])
	end

	def can_access
		# only admin can access artist pages and perform changes
		redirect_to root_path unless user_signed_in? && current_user.is_admin
	end

	def update_links

		# expect params to contain a hash where the key is the ID of a SongLinkType and the value the associated URL for this artist
		params[:artist][:artist_links].each do |link_type_id, link_url|
			# get current artist link value for the given type
			current_link = @artist.artist_links.where(song_link_type_id: link_type_id.to_i).first

			# if the artist doesn't have a link of this particular type and an URL has been specified
			if current_link.nil? && link_url.present?
				# the link must be created
				ArtistLink.create(artist: @artist, song_link_type_id: link_type_id, url: link_url)
			# otherwise, if no URL has been specified and a link of this type exists
			elsif current_link.present? && link_url.empty?
				# the link must be destroyed
				current_link.destroy
			# otherwise, if there already is a link of this type and a different URL has been specified
			elsif current_link.present? && (link_url != current_link.url)
				# only then, update the existing link
				current_link.update(url: link_url)
			end
		end
	end
end
