module Webhooks
	class Subscriptions
		def initialize(event)
			@event = event
			@customer = @event.data.object
			@user = User.find_by_stripe_customer_id(@customer.id)
		end

		def deleted
			@user.update(is_contributor: false, stripe_subscription_id: nil, subscribed_until: nil)
		end
	end
end
