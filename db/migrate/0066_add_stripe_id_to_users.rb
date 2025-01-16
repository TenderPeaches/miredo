class AddStripeIdToUsers < ActiveRecord::Migration[7.1]
    def change
        add_column :users, :stripe_customer_id, :string, comment: "Stripe Customer ID, if null then user has never had a subscription"
        add_column :users, :stripe_subscription_id, :string, comment: "Stripe subscription ID, null if currently unsubscribed"
        add_column :users, :subscribed_until, :datetime, comment: "Subscription valid until"
        add_column :users, :subscription_active, :boolean, comment: "Whether the user's subscription is currently active (due to be renewed) or not"
    end
end
