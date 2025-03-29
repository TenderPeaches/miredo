module SubscriptionsHelper
	def subscription_features
		[
			Feature.new(t("content.subscriptions.features.view_songs")),
			Feature.new(t("content.subscriptions.features.references")),
			Feature.new(t("content.subscriptions.features.helpers")),
			Feature.new(t("content.subscriptions.features.adjust_key")),
			Feature.new(t("content.subscriptions.features.track_practices"), user_access: true),
			Feature.new(t("content.subscriptions.features.settings"), user_access: true),
			Feature.new(t("content.subscriptions.features.new_songs"), premium_access: true),
			Feature.new(t("content.subscriptions.features.setlists"), premium_access: true),
			Feature.new(t("content.subscriptions.features.statistics"), premium_access: true),
			Feature.new(t("content.subscriptions.features.calendar"), premium_access: true),
		]
	end
end
