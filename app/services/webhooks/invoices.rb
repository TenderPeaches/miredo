module Webhooks
	class Invoices
		def initialize(event)
			@event = event
			@invoice = @event.data.object
		end

		# when a customer invoice is paid
		def paid
			user = User.find_by_stripe_customer_id(@invoice.customer)

			#! should fire an email because user who paid has not had its stripe customer ID assigned to, and will not be able to access the premium features
			return unless user

			# ensure the subscription has been acivated from Stripe's end
			subscription = Stripe::Subscription.retrieve(@invoice.subscription)
			if subscription.status.to_sym == :active

				# update the user's model subscription info to activate the features and keep track of the subscription data without querying the Stripe API every time
				user.update(is_contributor: true, stripe_subscription_id: subscription.id, subscribed_until: Time.at(subscription.current_period_end), subscription_active: true)
			end
		end
	end
end
