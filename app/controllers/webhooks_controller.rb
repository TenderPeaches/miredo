##
# Endpoint for Stripe webhooks
# https://docs.stripe.com/webhooks
class WebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token		# not necessary with webhook requests

	# all Stripe webooks are POSTed to /webhook
	def create
		# fetch the request content
		payload = request.body.read
		event = nil

		# extract the event from the request's payload
		begin
			event = Stripe::Event.construct_from(
				JSON.parse(payload, symbolize_names: true)
			)
		rescue JSON::ParserError => e
			# invalid payload
			status 400
			return
		end

		debugger
		case event.type
		when "invoice.paid"
			Webhooks::Invoice.new(event).paid
		end

		# handle the event

		status 200
	end

	private

	def webhook_key
		ENV["STRIPE_WEBHOOK_KEY"]
	end
end
