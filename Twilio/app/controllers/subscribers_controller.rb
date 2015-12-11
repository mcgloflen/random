class SubscribersController < ApplicationController
    def new
        @subscriber = Subscriber.new
    end
    
    def create
        @subscriber = Subscriber.create(subscriber_params)
        if @subscriber.valid?
            Stripe.api_key = "sk_test_gZzKQambAXAB8mykCdL2s9C2"

            # Get the credit card details submitted by the form
            token = params[:stripeToken]
            
            # Create the charge on Stripe's servers - this will charge the user's card
            begin
              charge = Stripe::Charge.create(
                :amount => 100, # amount in cents, again
                :currency => "usd",
                :source => token,
                :description => "Example charge"
              )
            rescue Stripe::CardError => e
              # The card has been declined
            end
            if charge_error
              flash[:error] = charge_error
              render :new
            else
              @subscriber.save
              @subscriber.send_message
              @subscriber.send_message_two
              redirect_to "/subscribers/new"
            end
        else
            flash[:error] = 'one or more errors in your order'
            render :new
        end
    end
    
private
    def subscriber_params
        params.require(:subscriber).permit(:phone)
    end
end
