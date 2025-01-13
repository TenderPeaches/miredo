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

    def create
    end
end
