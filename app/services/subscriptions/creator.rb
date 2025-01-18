module Subscriptions
    class Creator
        def initialize(user)
            @user = user
            @price = Stripe::Product
        end

        # checkout for a new subscription
        def checkout(options = {})
            validate_options options
            create_stripe_customer if @user.stripe_customer_id.nil?

            # single product for now, keep it simple
            product = Stripe::Product.retrieve("prod_RZPcMd7DgbHF6Z")
            price = Stripe::Price.retrieve(product.default_price)

            # create a checkout session
            checkout_session = Stripe::Checkout::Session.create({
                success_url: options[:success_url] || options["success_url"],
                cancel_url: options[:cancel_url] || options["cancel_url"],
                mode: "subscription",
                line_items: [{
                    quantity: 1,            # single subscription
                    price: price.id
                }],
                customer: @user.stripe_customer_id
            })

            CheckoutResult.new(checkout_session)
        end

        # when a subscription is confirmed/paid for, its effects need to apply to the user
        def create(options = {})
            @user.update(is_contributor: true)
        end

        private

        class CheckoutResult
            def initialize(checkout_session)
                @checkout_session = checkout_session
            end

            def session
                @checkout_session
            end
        end

        def validate_options(options)
            raise "Subscriptions::Creator#checkout options Missing success_url" if (!options.key?(:success_url) && !options.key?("success_url"))
            raise "Subscriptions::Creator#checkout options Missing cancel_url" if (!options.key?(:cancel_url) && !options.key?("cancel_url"))
        end

        def create_stripe_customer
            # create the Stripe Customer object through the Stripe API
            customer = Stripe::Customer.create({
                email: @user.email,
                metadata: {
                    miredo_user_id: @user.id
                }
            })

            # link the Stripe::Customer object back to the User
            @user.update(stripe_customer_id: customer["id"])
        end
    end
end
