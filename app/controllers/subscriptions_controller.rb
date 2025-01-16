class SubscriptionsController < ApplicationController
    def new
        # user must be logged in to subscribe
        if user_signed_in?
            # check if the request contained a checkout parameter
            # use a checkout param rather than an extra route because semantically, it makes the most sense to use the subscriptions#new action
            if params[:checkout]
                checkout_session = Subscriptions::Creator.new(current_user).checkout(success_url: root_url, cancel_url: new_subscription_url).session

                redirect_to checkout_session.url, allow_other_host: true, status: 303
            end
        # if user not logged in
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        @user = User.find_by_id(params[:user_id])

        # ensure the subscription is being cancelled by the user currently logged in, and the current user has a stripe_customer_id (otherwise it's assumed impossible for said user to be subscribed, as having that ID is a required part of the process)
        if current_user == @user && current_user.stripe_customer_id
            # make sure to expand the request to include subscriptions
            @subscription = Stripe::Customer.retrieve(id: current_user.stripe_customer_id, expand: ['subscriptions']).subscriptions.data.first
            # cancel the subscription whenever the current billing period ends
            Stripe::Subscription.update(@subscription.id, cancel_at_period_end: true)
            # update the user info to reduce the need for Stripe API calls
            current_user.update(subscription_active: false)
        end
    end
end
