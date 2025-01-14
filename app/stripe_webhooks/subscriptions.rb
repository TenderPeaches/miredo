module Webhooks
	class Subscriptions
		def initialize(event, subscription = nil)
			@event = event
			@subscription = subscription || @event.data.object
		end
	end
end
