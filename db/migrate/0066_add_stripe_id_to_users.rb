class AddStripeIdToUsers < ActiveRecord::Migration[7.1]
    def change
        add_column :users, :stripe_customer_id, :string, comment: "Stripe Customer ID, if null then user has never had a subscription"
    end
end
